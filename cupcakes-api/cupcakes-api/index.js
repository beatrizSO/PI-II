const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Middleware para ler dados JSON
app.use(express.json());

// Rota de teste
app.get('/', (req, res) => {
  res.send('API Cupcakes funcionando!');
});

// Iniciar o servidor
app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});

require('dotenv').config();
const mongoose = require('mongoose');

// Conectar ao MongoDB
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Conectado ao MongoDB'))
  .catch(err => console.error('Erro ao conectar no MongoDB:', err));

  
const cupcakeRoutes = require('./routes/cupcakeRoutes');
app.use('/api', cupcakeRoutes);
