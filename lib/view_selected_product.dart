import 'package:flutter/material.dart';
import 'package:waste0/payment_details.dart';

import 'product.dart';

class SelectedProdectScreen extends StatelessWidget {
  final Product product;

  SelectedProdectScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              product.imageUrl,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Text('Product Name: ${product.productName}'),
            SizedBox(
              height: 30,
            ),
            Text(
              'Details: ${product.productDetails}',
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Price: ${product.price.toStringAsFixed(2)} OMR',
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentDetailsPage(totalPrice: product.price, deliveryCharge: 5.0,),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
