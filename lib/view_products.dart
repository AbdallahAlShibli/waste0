import 'package:flutter/material.dart';
import 'package:waste0/view_selected_product.dart';

import 'product.dart';

class ViewProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> products = [
    Product(
      productName: 'Old HP Laptop',
      productDetails: 'Old HP Laptop with Windows 10, RAM 8GB, Storage 512SSD',
      price: 11.99,
      imageUrl: 'laptop.png',
    ),
    Product(
      productName: 'Old HP Laptop',
      productDetails: 'Old HP Laptop with Windows 10, RAM 8GB, Storage 512SSD',
      price: 39.99,
      imageUrl: 'laptop.png',
    ),
    Product(
      productName: 'Old HP Laptop',
      productDetails: 'Old HP Laptop with Windows 10, RAM 8GB, Storage 512SSD',
      price: 99.99,
      imageUrl: 'laptop.png',
    ),
    Product(
      productName: 'Old HP Laptop',
      productDetails: 'Old HP Laptop with Windows 10, RAM 8GB, Storage 512SSD',
      price: 29.99,
      imageUrl: 'laptop.png',
    ),
    // Add more products as needed
  ];

  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: Implement navigation to the cart screen
                    },
                    icon: Image.asset(
                      'cart.png',
                      width: 80,
                      height: 80,
                    ),
                    iconSize: 60,
                  ),
                  Text('View Cart'),
                ],
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Image.asset(
                    'products.png',
                    width: 100,
                    height: 100,
                  ),
                  Text('E-Waste Manager'),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              // TODO: Implement search logic based on the value
              print('Search query: $value');
            },
            decoration: InputDecoration(labelText: 'Search'),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            // Add your widgets related to the new Column here
            // For example, you can add buttons, text, etc.
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: Column(
            children: products
                .where((product) =>
                    product.productName.toLowerCase().contains(
                          _searchController.text.toLowerCase(),
                        ) ||
                    product.price.toString().contains(_searchController.text))
                .map((product) => ProductCard(product: product))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          print(product.price);
          // Navigate to the next page when the ListTile is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedProdectScreen(product: product),
            ),
          );
        },
        leading: Image.asset(
          product.imageUrl,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        title: Text(product.productName),
        subtitle: Text('${product.price.toStringAsFixed(2)} OMR'),
      ),
    );
  }
}
