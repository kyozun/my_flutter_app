import 'package:crudproduct/controller/product_controller.dart';
import 'package:crudproduct/models/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController;

  ProductScreen({required this.productController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: productController.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No products found');
        } else {
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('${product.price}'),
              );
            },
          );
        }
      },
    );
  }
}
