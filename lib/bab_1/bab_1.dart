import 'dart:async';

// A. Model Data
class User {
  String name;
  int age;
  late List<Product> products;
  Role? role;

  User(this.name, this.age, {this.role});
}

class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}

// B. Enum Role
enum Role { Admin, Customer }

// C. Object-Oriented Programming (OOP)
class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age, role: Role.Admin);

  // Method untuk menambah produk
  void addProduct(Product product) {
    if (product.inStock) {
      products.add(product);
      print('${product.productName} berhasil ditambahkan.');
    } else {
      throw Exception('Produk ${product.productName} tidak tersedia dalam stok.');
    }
  }

  // Method untuk menghapus produk
  void removeProduct(Product product) {
    products.remove(product);
    print('${product.productName} berhasil dihapus.');
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, role: Role.Customer);

  // Method untuk melihat daftar produk
  void viewProducts() {
    if (products.isNotEmpty) {
      print('Daftar Produk yang Tersedia:');
      for (var product in products) {
        print('- ${product.productName} | Harga: \$${product.price} | Stok: ${product.inStock ? "Tersedia" : "Habis"}');
      }
    } else {
      print('Belum ada produk yang tersedia.');
    }
  }
}

// D. Null Safety & Late Initialization
// Produk pada User akan diinisialisasi setelah objek pengguna dibuat (dengan late pada deklarasi)

// E. Exception Handling
void addProductSafely(AdminUser adminUser, Product product) {
  try {
    adminUser.addProduct(product);
  } on Exception catch (e) {
    print('Gagal menambahkan produk: ${e.toString()}');
  }
}

// F. Asynchronous Programming
Future<void> fetchProductDetails(String productName) async {
  print('Mengambil detail produk untuk $productName...');
  await Future.delayed(Duration(seconds: 2));
  print('Detail produk $productName berhasil diambil dari server.');
}

// G. Collections
class ProductManager {
  Map<String, Product> productMap = {};
  Set<Product> uniqueProducts = {};

  // Method untuk menambah produk ke dalam koleksi tanpa duplikasi
  void addUniqueProduct(Product product) {
    if (uniqueProducts.add(product)) {
      productMap[product.productName] = product;
      print('${product.productName} berhasil ditambahkan ke koleksi.');
    } else {
      print('${product.productName} sudah ada dalam koleksi.');
    }
  }

  // Method untuk menampilkan daftar produk dalam koleksi
  void displayProducts() {
    if (productMap.isNotEmpty) {
      print('Daftar Produk dalam Koleksi:');
      productMap.forEach((key, product) {
        print('- $key | Harga: \$${product.price} | Stok: ${product.inStock ? "Tersedia" : "Habis"}');
      });
    } else {
      print('Tidak ada produk dalam koleksi.');
    }
  }
}

void main() {
  // Membuat instance ProductManager untuk koleksi produk
  ProductManager productManager = ProductManager();

  // Menambahkan produk ke dalam sistem
  Product product1 = Product('Laptop', 1500.0, true);
  Product product2 = Product('Smartphone', 800.0, true);
  Product product3 = Product('Headphone', 200.0, false);

  productManager.addUniqueProduct(product1);
  productManager.addUniqueProduct(product2);
  productManager.addUniqueProduct(product3);
  productManager.addUniqueProduct(product1); // Contoh duplikasi produk

  // Menampilkan daftar produk dalam koleksi
  productManager.displayProducts();

  // Membuat instance AdminUser dan CustomerUser
  AdminUser admin = AdminUser('Anggraini', 20);
  CustomerUser customer = CustomerUser('Andari', 21);

  // Inisialisasi daftar produk pada User
  admin.products = [];
  customer.products = admin.products;

  // Menambahkan produk dengan pengecekan stok dan exception handling
  addProductSafely(admin, product1);
  addProductSafely(admin, product3);// Produk ini tidak tersedia dalam stok

  // Customer melihat daftar produk yang ditambahkan oleh admin
  customer.viewProducts();

  // Mengambil detail produk secara asinkron
  fetchProductDetails('Laptop');
  fetchProductDetails('Smartphone');
}
