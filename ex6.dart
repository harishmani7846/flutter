import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class Product {
  final String name;
  final String brand;
  final int price;
  final String image; 
  Product(this.name, this.brand, this.price, this.image);
}
List<Product> products = [
  Product("Smartphone", "Samsung", 29999, "https://via.placeholder.com/150"),
  Product("Laptop", "Dell", 54999, "https://via.placeholder.com/150"),
  Product("Headphones", "Sony", 4999, "https://via.placeholder.com/150"),
  Product("Smartwatch", "Apple", 19999, "https://via.placeholder.com/150"),
  Product("Camera", "Canon", 25999, "https://via.placeholder.com/150"),
  Product("Tablet", "Lenovo", 15999, "https://via.placeholder.com/150"),
];
List<Product> cart = [];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "productShop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: ProductPage(),
    );
  }
}
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Color.fromARGB(255, 228, 231, 13),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two boxes per row
            childAspectRatio: 0.65, // Height/Width ratio
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(product.brand, style: TextStyle(color: Colors.grey)),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "₹${product.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 35),
              ),
              child: Text("Add to Cart"),
              onPressed: () {
                cart.add(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.name} added to cart!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class CartPage extends StatelessWidget {
  int getTotal() {
    int total = 0;
    for (var item in cart) total += item.price;
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Cart is empty!"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.network(cart[index].image),
                          title: Text(cart[index].name),
                          subtitle: Text(cart[index].brand),
                          trailing: Text("₹${cart[index].price}"),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Total: ₹${getTotal()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.deepPurple,
            ),
            child: Text("Proceed to Checkout"),
            onPressed: cart.isEmpty
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 15,
                        offset: Offset(0, 10)),
                  ],
                ),
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text("🎉", style: TextStyle(fontSize: 60)),
                    SizedBox(height: 20),
                    Text(
                      "Thank You!",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your order has been placed successfully.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 20),
                    Icon(Icons.local_shipping, size: 60, color: Colors.green),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(Icons.arrow_back),
                      label: Text("Back to Shop",
                          style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        cart.clear();
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }  }
