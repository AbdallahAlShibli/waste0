import 'package:flutter/material.dart';
import 'package:waste0/new_request.dart';
import 'package:waste0/view_products.dart';

class SelectService extends StatefulWidget {
  const SelectService({super.key});

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select Service'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewProductsScreen()),
                        )
                      },
                      icon: Image.asset(
                        'products.png', // Set the height of the image
                        fit: BoxFit
                            .cover, // Adjust how the image should be displayed within the widget
                      ),
                      iconSize: 200,
                    ),
                    Text("View the electronic products for sale")
                  ],
                )),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewRequstScreen()),
                        )
                      },
                      icon: Image.asset(
                        'request.png', // Set the height of the image
                        fit: BoxFit
                            .cover, // Adjust how the image should be displayed within the widget
                      ),
                      iconSize: 200,
                    ),
                    Text("Send Request to collect your electornic waset")
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
