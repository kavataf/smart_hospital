const express = require('express');
const User = require('../models/auth');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');
const nodemailer = require('nodemailer');
const { userInfo } = require('os');
require('dotenv').config();
const router = express.Router();

const maxAttempts = 3;

// signup
router.post('/signup', async (req, res) => {
    try{
        let {name, email, password} = req.body;
        const hashedPassword = await bcrypt.hash(password, 10);
        const exists = await User.exists({email});
        // check if user exists
        if(exists) {
            return res.status(409).json({
                status: "Failed",
                message: "User already exists"
            });
        }
        // if not, create and save new user
        const newUser = new User({name, email, password: hashedPassword});
        const savedUser = await newUser.save();
         res.status(201).json({
            status: "Success",
            message: "Successfully registered user",
            user: savedUser
         });

    } catch (error){
        res.status(400).json({status: "Failed", error: error.message});
    }
    });

// signin
router.post('/signin', async (req, res) => {
    try {
        const {email, password} = req.body;
        //  find user
       const user = await User.findOne({email});
        // user doesn't exists 
       if(!user) {
            return res.status(401).json({
                status: "Failed",
                message: "Invalid email entered"
            });
       }
        // user exists
       const enteredPassword = await bcrypt.compare(password, user.password);
        // password incorrect
        if(!enteredPassword){
            return res.status(401).json({
                status: "Failed",
                message: "Invalid password entered"
            });
        }   
        // correct password generate jwt
        const token = jwt.sign({id: user._id},process.env.JWT_SECRET, {expiresIn: '1d'});
        res.status(200).json({
            status: "Success",
            message: "Successfull login",
            token,
            user: {
                id: user._id,
                email: user.email
            }
        });
    } catch (error){
       res.status(400).json({status: "Failed", error: error.message});
    }
});

// forgotpassword
router.post('/forgotpassword', async (req, res) => {
    try {
        const {email} = req.body;
        // find user
       const user = await User.findOne({email});
       if(!user) {
            return res.status(401).json({
                status: "Failed",
                message: "User not found"
            });
       }
        // email otp
        const otpCode = crypto.randomInt(1000, 10000).toString();
        const hashedCode = crypto.createHash('sha256').update(otpCode).digest('hex');
        const tokenExpires = new Date(Date.now() + 10 * 60 * 1000);
        // save fields to DB
        user.emailOtp = hashedCode;
        user.emailOtpExpires = tokenExpires;

        await user.save();
        // send email
        const transporter = nodemailer.createTransport({
            host: 'smtp.gmail.com',
            port: 587,
            secure: false,
            auth: {
                user: process.env.GMAIL_USER,
                pass: process.env.GMAIL_PASS
            },
            tls: {
                rejectUnauthorized: false
            }
        });
        transporter.verify((error, success) => {
            if(error) {
                console.log(`Connection error: ${error}`);
            } else {
                console.log(`The server is ready to take our messages`);
            }
        });
        const mailDetails = {
            from:`Security team Hosp ${process.env.GMAIL_USER}`, 
            to: user.email,
            subject: 'Your 4-Digit Secure Verification Code',
            text: `Hello,\n Your verification code is ${otpCode}\n This code will expire shortly. Do not share it with anyone`,
            html:  `
                <div style="font-family: sans-serif; padding: 20px; border: 1px solid #eee; border-radius: 5px;">
                <h2>Secure Verification Code</h2>
                <p>Hello,</p>
                <p>Use the secure code below to complete your verification process:</p>
                <div style="background-color: #f4f4f4; padding: 15px; font-size: 24px; font-weight: bold; text-align: center; letter-spacing: 5px; color: #333;">
                    ${otpCode}
                </div>
                <p style="color: #666; font-size: 12px; margin-top: 20px;">This code will expire in 10 minutes. If you did not request this code, please ignore this email.</p>
                </div>
            `,

        }
        transporter.sendMail(mailDetails, (error, info) => {
            if(error) {
                return console.log(error);
            } else {
                console.log(info.messageId);
            return res.status(200).json({
                message: "A code has been sent to email entered"
            });
            }
        });

    } catch (error) {
        res.status(400).json({status: "Failed", error: error.message});
    };
});


// verify reset code
router.post('/verify-reset-code', async (req, res) => {
    try {
        const { email, code } = req.body;

        // Find user
        const user = await User.findOne({ email });

        if (!user) {
            return res.status(400).json({
                status: 'Failed',
                message: 'User not found'
            });
        }

        // Check if code exists
        if (!user.emailOtp || !user.emailOtpExpires) {
            return res.status(400).json({
                status: 'Failed',
                message: 'No verification code requested'
            });
        }

        // Check expiration
        if (Date.now() > user.emailOtpExpires.getTime()) {
            return res.status(400).json({
                status: 'Failed',
                message: 'Verification code has expired'
            });
        }
        
        
         if (user.resetCodeAttempts >= maxAttempts) {
                return res.status(429).json({
                    status: 'Failed',
                    message: 'Too many attempts. Please try again later!'
                });
            }           

        // Hash the code entered by the user
        const hashedCode = crypto
            .createHash('sha256')
            .update(code)
            .digest('hex');

        // Compare codes
        if (hashedCode !== user.emailOtp) {
            user.resetCodeAttempts += 1;
            await user.save();  
            
            return res.status(400).json({
                status: 'Failed',
                message: 'Invalid verification code'
            });
        }
            const resetToken = crypto.randomBytes(32).toString('hex');
            const hashedResetToken = crypto.createHash('sha256').update(resetToken).digest('hex');

            user.resetToken = hashedResetToken;
            user.resetTokenExpires = new Date(Date.now() + 10 * 60 * 1000);
            user.emailOtp = undefined;
            user.emailOtpExpires = undefined;
            user.resetCodeAttempts = 0;
            await user.save();

        res.status(200).json({
            status: 'Success',
            message: 'Code verified successfully',
            resetToken: resetToken
        });
        const response = pm.response.json();
        pm.environment.set("resetToken", response.resetToken);

    } catch (error) {
        res.status(500).json({
            status: 'Failed, try again!',
            message: error.message
        });
    }
});

// resetpassword
router.post('/resetpassword', async (req, res) => {
    try {
        let {resetToken, newPassword, confirmPassword} = req.body;
        // empty fields?
        if(!resetToken || !newPassword || !confirmPassword){
            return res.status(400).json({
                status: "Failed",
                message: "All fields required!"
            });
        }
        // compare passwords
        if(newPassword !== confirmPassword){
            return res.status(400).json({
                status: "Failed",
                message: "Passwords do not match!"
            });
        }
        // hash token
        const hashedToken = crypto.createHash('sha256').update(resetToken).digest('hex');
        // find user
        const user = await User.findOne(
            {resetToken : hashedToken, resetTokenExpires: {"$gte": Date.now()}});
        if(!user){
            return res.status(400).json({
                status: "Failed",
                message: "Invalid or expired reset token"
            });
        }
        // hash password
        const hashedPassword = await bcrypt.hash(newPassword, 10);
        user.password = hashedPassword;
        user.resetToken = undefined;
        user.resetTokenExpires = undefined;
        user.save();
         
        res.status(200).json({
            status: "Success",
            message: "Password reset successfully"
        });

    } catch (error) {
         res.status(500).json({
            status: 'Failed, try again!',
            message: error.message
        });
    };
});

module.exports = router;
