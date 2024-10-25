const express = require('express');
const router = express.Router();
const Cupcake = require('../models/Cupcake');

// GET: Lista de cupcakes
router.get('/cupcakes', async (req, res) => {
  try {
    const cupcakes = await Cupcake.find();
    res.json(cupcakes);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// POST: Adicionar cupcake
router.post('/cupcakes', async (req, res) => {
  const cupcake = new Cupcake({
    name: req.body.name,
    flavor: req.body.flavor,
    price: req.body.price,
    description: req.body.description,
  });

  try {
    const newCupcake = await cupcake.save();
    res.status(201).json(newCupcake);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
