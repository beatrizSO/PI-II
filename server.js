const http = require('http');

const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello, World!\n');
});

server.listen(3000, () => {
    console.log('Server running at http://127.0.0.1:3000/');
});


//lógica de login/////////////////////////

const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('./User');

const app = express();
app.use(express.json());

app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    // Verificar se o usuário existe
    const user = await User.findOne({ email });
    if (!user) return res.status(400).json({ message: 'Usuário não encontrado!' });

    // Comparar senha
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(400).json({ message: 'Senha incorreta!' });

    // Gerar token JWT
    const token = jwt.sign({ id: user._id }, 'secretKey', { expiresIn: '1h' });
    res.json({ token });
});

app.listen(3000, () => {
    console.log('Server rodando na porta 3000');
});


// rota pra listar produtos /////////
const Product = require('./Product');

app.get('/products', async (req, res) => {
    const products = await Product.find();
    res.json(products);
});


// rota admin add produtos///////////

app.post('/add-product', async (req, res) => {
    const { name, price } = req.body;
    const product = new Product({ name, price });
    await product.save();
    res.json({ message: 'Produto adicionado com sucesso!' });
});

app.delete('/delete-product/:id', async (req, res) => {
    await Product.findByIdAndDelete(req.params.id);
    res.json({ message: 'Produto excluído com sucesso!' });
});

// rota pra cadastro novo user //////////q

const bcrypt = require('bcryptjs');
const User = require('./User'); // Certifique-se de que o modelo User está importado corretamente

// Rota para registrar um novo usuário
app.post('/register', async (req, res) => {
    const { email, password } = req.body;

    // Verificar se o email já está cadastrado
    const userExists = await User.findOne({ email });
    if (userExists) {
        return res.status(400).json({ message: 'Email já cadastrado!' });
    }

    // Criptografar a senha
    const hashedPassword = await bcrypt.hash(password, 10);

    // Criar um novo usuário
    const newUser = new User({ email, password: hashedPassword });
    await newUser.save();

    res.json({ message: 'Usuário cadastrado com sucesso!' });
});
