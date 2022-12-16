import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  Page1({super.key, this.age});
  int? age;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page 1"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              Text(widget.age.toString()),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, "I am page 1 hello....");
                  },
                  child: Text("Close")),
            ],
          ),
        ),
      ),
    );
  }
}
