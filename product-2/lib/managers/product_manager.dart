import '../models/product.dart';

class ProductManager {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print('Product added successfully!');
  }

  List<Product> viewAllProducts() {
    return _products;
  }

  Product? viewProduct(int index) {
    if (index >= 0 && index < _products.length) {
      return _products[index];
    } else {
      print('Invalid product index');
      return null;
    }
  }

  void editProduct(int index, Product newProduct) {
    if (index >= 0 && index < _products.length) {
      _products[index] = newProduct;
      print('Product updated successfully!');
    } else {
      print('Invalid product index');
    }
  }

  void deleteProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
      print('Product deleted successfully!');
    } else {
      print('Invalid product index');
    }
  }
}