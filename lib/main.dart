import 'package:e_commerce/widget/ProductCard.dart';
import 'package:e_commerce/widget/SectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widget/TopSeller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            title: const Center(
              child: Text(
                'E-Commerce', // Judul aplikasi
                style: TextStyle(fontSize: 18),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16.0),

            // Search bar dan kotak persegi di bawah navbar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Here',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  // Kotak persegi
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.filter_alt, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Hero Section dengan Gradient Background di bawah search bar
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 280, // Tinggi Hero section
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.blueAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  // Bagian kiri dengan teks
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Todays Deal',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '50% OFF',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Temukan produk terbaik dengan penawaran menarik. Potongan 50% hanya untuk anda sekarang. Jangan sampai kehabisan!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                            height: 16), // Jarak antara teks dan tombol
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Buy It Now',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 200, // Lebar gambar
                    height: 200, // Tinggi gambar
                    child: Image.asset(
                      'assets/images/doll.png', // Ganti dengan path gambar PNG kamu
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader("Top Sellers"),
                  const SizedBox(height: 12),
                  Container(
                    height: 170,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopSeller(
                            'assets/images/doll.png', 'Toko 1', 4.5),
                        TopSeller(
                            'assets/images/doll.png', 'Toko 2', 4.7),
                        TopSeller(
                            'assets/images/doll.png', 'Toko 3', 4.5),
                        TopSeller(
                            'assets/images/doll.png', 'Toko 4', 4.8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Top Services
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue,
                  child: const Text(
                    'Top Services',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          // container 1
                          Positioned(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('images/doll.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          // container 2
                          Positioned(
                            right: 5,
                            top: 23,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage('images/doll.png'),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    'Anggraini Andari',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    'Informatika',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Mahasiswa Prodi Informatika Unkhair',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 207, 207, 207),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.blue, size: 14),
                                            SizedBox(width: 4),
                                            Text(
                                              '4.9',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'Buy Now',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),


            SectionHeader("Produk Terbaru"),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap:
                    true, // Agar grid tidak scrollable, karena sudah ada SingleChildScrollView
                physics:
                    NeverScrollableScrollPhysics(), // Agar hanya scroll di SingleChildScrollView
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 16.0, // Jarak antar kolom
                mainAxisSpacing: 16.0, // Jarak antar baris
                childAspectRatio: 0.75, // Rasio tinggi dan lebar card
                children: [
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 1',
                    productPrice: 'Rp 150.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 2',
                    productPrice: 'Rp 120.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 3',
                    productPrice: 'Rp 180.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 4',
                    productPrice: 'Rp 200.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 4',
                    productPrice: 'Rp 200.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 5',
                    productPrice: 'Rp 120.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 5',
                    productPrice: 'Rp 50.000',
                  ),
                  ProductCard(
                    imagePath: 'assets/images/doll.png',
                    productName: 'Produk 6',
                    productPrice: 'Rp 280.000',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Tetapkan indeks untuk tampilan default
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
