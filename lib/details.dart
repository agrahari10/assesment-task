import 'package:flutter/material.dart';
import 'main.dart';
class Details extends StatefulWidget {
  const Details({Key? key, this.data}) : super(key: key);

  final data;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: " + widget.data['name'],),
            Text("ID: " + widget.data['id']),
            Text("Company: " + widget.data['company']),
            Text("Invoice paid: " + widget.data['invoicepaid']),
            Text("Invoice Pending: " + widget.data['invoicePending']),

          ],
        ),

      ),
    );
  }
}
