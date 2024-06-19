import 'dart:io';
import '../lib/models/product.dart';
import '../lib/managers/product_manager.dart';

void main() {
  final productManager = ProductManager();

  while (true) {
    stdout.write(
        'Enter an option (1: Add product, 2: View all products, 3: View product, 4: Edit product, 5: Delete product, 6: Exit): ');
    final option = stdin.readLineSync();

    switch (option) {
      case '1':
        stdout.write('Enter product name: ');
        final name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        final description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        final price = double.parse(stdin.readLineSync()!);

        final product = Product()
          ..name = name
          ..description = description
          ..price = price;

        productManager.addProduct(product);
        break;

      case '2':
        final products = productManager.viewAllProducts();
        if (products.isNotEmpty) {
          print('All products:');
          for (int i = 0; i < products.length; i++) {
            final product = products[i];
            print('$i: ${product.name} (${product.description}) - \$${product.price}');
          }
        } else {
          print('No products found');
        }
        break;

      case '3':
        stdout.write('Enter product index: ');
        final index = int.parse(stdin.readLineSync()!);
        final product = productManager.viewProduct(index);
        if (product != null) {
          print('${product.name} (${product.description}) - \$${product.price}');
        }
        break;

      case '4':
        stdout.write('Enter product index: ');
        final index = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new product name: ');
        final name = stdin.readLineSync()!;
        stdout.write('Enter new product description: ');
        final description = stdin.readLineSync()!;
        stdout.write('Enter new product price: ');
        final price = double.parse(stdin.readLineSync()!);

        final newProduct = Product()
          ..name = name
          ..description = description
          ..price = price;

        productManager.editProduct(index, newProduct);
        break;

      case '5':
        stdout.write('Enter product index: ');
        final index = int.parse(stdin.readLineSync()!);
        productManager.deleteProduct(index);
        break;

      case '6':
        print('Exiting...');
        return;

      default:
        print('Invalid option');
    }
  }
}