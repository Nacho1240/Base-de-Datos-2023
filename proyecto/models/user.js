import mongoose from "mongoose";

const userSchema = mongoose.Schema({
    email: {
        type: String,
        
    },
    password:{
        type: String,
        
    },
    name: {
        type: String,
        
    },
    lastname:{
        type: String,
        
    },
    age:{
        type: Number,
        
    },
    address:{
        type: String,
        
    },
})

export default mongoose.model("User", userSchema);