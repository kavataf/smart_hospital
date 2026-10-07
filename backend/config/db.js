const mongoose = require('mongoose');

const connectDB = async () => {
    try {
      const conn = await mongoose.connect(process.env.DATABASE_URL);
      console.log(`MongoDB is connected ${conn.connection.host}`);
    } catch (error) {
        console.log(`Database connection error ${error.message}`);
        process.exit(1);
    }
}
module.exports = connectDB;