import 'package:crudproduct/models/product.dart';
import 'package:crudproduct/repository/product_repository.dart';

class ProductController {
  final ProductRepository productRepository;

  ProductController(this.productRepository);

  Future<List<Product>> getAllProducts() async {
    return productRepository.getProducts();
  }

  Future<void> addNewProduct(Product product) async {
    await productRepository.createProduct(product);
  }

  Future<void> updateExistingProduct(String id, Product product) async {
    await productRepository.updateProduct(id, product);
  }

  Future<void> deleteProduct(String id) async {
    await productRepository.removeProduct(id);
  }
}
