const mongoose = require('mongoose');

const CupcakeSchema = new mongoose.Schema({
  name: { type: String, required: true },
  flavor: { type: String, required: true },
  price: { type: Number, required: true },
  description: { type: String },
});

module.exports = mongoose.model('Cupcake', CupcakeSchema);
