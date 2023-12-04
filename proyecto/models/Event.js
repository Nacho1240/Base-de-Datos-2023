const mongoose = require('mongoose');

const eventoSchema = new mongoose.Schema({
    title: String,
    description: String,
    date: Date,
    fechaTermino: Date, 
    options: [String], 
    voters: [String],
    votes: {
        type: Map, 
        of: Number, 
    },
    activo: {
        type: Boolean,
        default: true,
    },
});

const Evento = mongoose.model('Evento', eventoSchema);

module.exports = Evento;
