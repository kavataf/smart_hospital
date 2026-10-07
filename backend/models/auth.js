const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const userSchema = new Schema({
    name: String,
    email: {type: String, unique: true},
    password: String,
    emailOtp: {type: String, default: null},
    emailOtpExpires: {type: Date, default: null},
    resetCodeAttempts : {type: Number, default: 0},
    resetToken: {type: String, default: null},
    resetTokenExpires: {type: Date, default: null},
});

const User = mongoose.model('User', userSchema);

module.exports = User;
