import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List products = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:3000/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtos')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text('\$${products[index]['price']}'),
            onTap: () {
              // Adicionar ao carrinho
            },
          );
        },
      ),
    );
  }
}
