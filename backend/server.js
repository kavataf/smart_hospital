const express = require('express');
const connectDB = require('./config/db');
const apiRoutes = require('./api/authRoutes');
// load variables from .env into process.env
require('dotenv').config(); 

// connect to database
connectDB();

const app = new express();

// middleware
app.use(express.json());

app.use('/user', apiRoutes);

app.get('/', (req, res) => {
    res.json({
        message: 'Smart hospital is running'
    })
});

const PORT = process.env.PORT;
app.listen(PORT, () => {
console.log(`Server is running on port ${PORT}`);
})