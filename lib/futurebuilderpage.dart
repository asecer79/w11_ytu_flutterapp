//future builder widget

import 'dart:io';

import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({super.key});

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<List<String>?> getCities() async {
    await Future.delayed(Duration(seconds: 5));
    var cities = ["Ankara", "İzmir", "İstanbul"];
    return cities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Builder")),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: FutureBuilder(
          future: getCities(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var cities = snapshot.data;
              return ListView.builder(
                itemCount: cities!.length,
                itemBuilder: (context, index) {
                  return Text(cities[index]);
                },
              );
            } else {
              return Center(child: Text("Loading"));
            }
          },
        ),
      ),
    );
  }
}
