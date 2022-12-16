import 'package:flutter/material.dart';
import 'package:w11_ytu_flutterapp/Page1.dart';
import 'package:w11_ytu_flutterapp/page2.dart';
import 'package:w11_ytu_flutterapp/page3.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      bottomNavigationBar: BottomAppBar(
        elevation: 25,
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    var returnedData =
                        await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Page1(
                          age: 36,
                        );
                      },
                    ));

                    print(returnedData);
                  },
                  child: Text("GoP1")),
              SizedBox(width: 5),
              ElevatedButton(
                  onPressed: () async {
                    var returnedData =
                        await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Page2();
                      },
                    ));

                    print(returnedData);
                  },
                  child: Text("GoP2")),
              SizedBox(width: 5),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Page3();
                      },
                    ));
                  },
                  child: Text("GoP3")),
            ],
          ),
        ),
      ),
    );
  }
}
