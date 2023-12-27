import 'package:flutter/material.dart';


class PaymentDetailsPage extends StatefulWidget {
  final double totalPrice;
  final double deliveryCharge;
  PaymentDetailsPage({required this.totalPrice, required this.deliveryCharge});

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  late TextEditingController cardNumberController;
  late TextEditingController cvvController;
  late TextEditingController expiryDateController;
  bool isCashPayment = false;

  @override
  void initState() {
    super.initState();
    cardNumberController = TextEditingController();
    cvvController = TextEditingController();
    expiryDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.totalPrice + widget.deliveryCharge;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: cvvController,
                    decoration: InputDecoration(labelText: 'CVV'),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextField(
                    controller: expiryDateController,
                    decoration: InputDecoration(labelText: 'Expiry Date'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: isCashPayment,
                  onChanged: (value) {
                    setState(() {
                      isCashPayment = value!;
                    });
                  },
                ),
                Text('Pay with Cash'),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Card Total: ${widget.totalPrice.toStringAsFixed(2)} OMR'),
            Text('Delivery Charge: ${widget.deliveryCharge.toStringAsFixed(2)} OMR'),
            Text('Total Amount: ${totalAmount.toStringAsFixed(2)} OMR'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement payment logic
                print('Payment button pressed');
              },
              child: Text('Pay'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement cancellation logic
                print('Cancel button pressed');
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
