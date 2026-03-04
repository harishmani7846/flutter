import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AlertExample(), debugShowCheckedModeBanner: false);
  }
}

class AlertExample extends StatelessWidget {
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Action"),
          content: Text("Do you want to continue?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Action Cancelled")));
              },
            ),

            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Action Confirmed")));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Box and SnackBar")),

      body: Center(
        child: ElevatedButton(
          child: Text("Show Alert Dialog"),
          onPressed: () {
            showAlertDialog(context);
          },
        ),
      ),
    );
  }
}
