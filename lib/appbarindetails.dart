import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarInDetailsPage extends StatefulWidget {
  const AppBarInDetailsPage({super.key});

  @override
  State<AppBarInDetailsPage> createState() => _AppBarInDetailsPageState();
}

class _AppBarInDetailsPageState extends State<AppBarInDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Appbar extras"),
            bottom:
                TabBar(indicatorWeight: 10, indicatorColor: Colors.red, tabs: [
              Tab(text: "Page1"),
              Tab(text: "Page2"),
              Tab(text: "Page3"),
            ]),
            actions: [
              ElevatedButton(onPressed: () {}, child: Text("Page1")),
              SizedBox(width: 5),
              ElevatedButton(onPressed: () {}, child: Text("Page2")),
              SizedBox(width: 5),
              Checkbox(value: true, onChanged: (value) {})
            ]),
        bottomNavigationBar: BottomAppBar(
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Save")),
                  SizedBox(width: 5),
                  ElevatedButton(onPressed: () {}, child: Text("Delete")),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.amber,
                  )
                ],
              ),
            )),
        body: TabBarView(children: [
          Container(color: Colors.amber, child: Text("Page 1 content")),
          Container(color: Colors.blue, child: Text("Page 2 content")),
          Container(color: Colors.white, child: Text("Page 3 content")),
        ]),
      ),
    );
  }
}
