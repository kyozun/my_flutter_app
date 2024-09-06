import 'package:crudproduct/pages/product_screen.dart';
import 'package:crudproduct/repository/product_repository.dart';
import 'package:crudproduct/services/product_service.dart';
import 'package:crudproduct/services/product_service_implement.dart';
import 'package:flutter/material.dart';
import 'controller/product_controller.dart';

void main() {
  final ProductApiService apiService = ProductApiServiceImpl();
  final ProductRepository productRepository = ProductRepositoryImpl(apiService);
  final ProductController productController = ProductController(productRepository);

  runApp(MyApp(productController: productController));
}

class MyApp extends StatelessWidget {
  final ProductController productController;

  const MyApp({Key? key, required this.productController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(productController: productController),
    );
  }
}
