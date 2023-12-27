import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class NewRequstScreen extends StatefulWidget {
  @override
  _NewRequstScreenState createState() => _NewRequstScreenState();
}

class _NewRequstScreenState extends State<NewRequstScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Requst'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15, left: 10, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      // await _resetPassword();
                    },
                    child: Text('View Your Requestes'),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      Image.asset(
                        'products.png',
                        width: 100,
                        height:
                            100, // Adjust how the image should be displayed within the widget
                      ),
                      Text('E-Waste Manager'),
                    ],
                  ),
                ),
              ],
            ),
            TextField(
              // controller: _emailController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              // controller: _emailController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              // controller: _emailController,
              decoration:
                  InputDecoration(labelText: 'Details About Your E-Wast'),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () => {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => NewRequstScreen()),
                      // )
                    },
                    icon: Image.asset(
                      'upload.png',
                      width: 150, 
                      height: 150,// Adjust how the image should be displayed within the widget
                    ),
                    iconSize: 60,
                  ),
                  Text('Upload picture to estimate the price'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // await _resetPassword();
                  },
                  child: Text('Send Request'),
                ),
                SizedBox(
                  height: 16,
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // await _resetPassword();
                  },
                  child: Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Future<void> _resetPassword() async {
  //   try {
  //     // Send password reset email
  //     await _auth.sendPasswordResetEmail(email: _emailController.text);

  //     // Display success message or navigate to a success screen
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Password Reset Email Sent'),
  //         content: Text('Check your email to reset your password.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } catch (e) {
  //     // Handle password reset errors (display a snackbar or dialog)
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Failed to send password reset email. Please try again.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
}
