import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//shared preferences is a kind of simple database, constructed as key and value pair (dictionary)
//is is used for store small amount of data for applications

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  var txtUserName = TextEditingController();
  var txtPassword = TextEditingController();
  var rememberMe = false;

  Future<void> getLoginInfo() async {
    var sp = await SharedPreferences.getInstance();

    setState(() {
      if (sp.containsKey("userName"))
        txtUserName.text = sp.getString("userName")!;
      if (sp.containsKey("password"))
        txtPassword.text = sp.getString("password")!;
      if (sp.containsKey("rememberMe")) rememberMe = sp.getBool("rememberMe")!;
    });

    print("Info read");
  }

  Future<void> setLoginInfo() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("userName", txtUserName.text);
    sp.setString("password", txtPassword.text);
    sp.setBool("rememberMe", rememberMe);

    print("Info Saved");
  }

  Future<void> forgetMe() async {
    var sp = await SharedPreferences.getInstance();
    if (sp.containsKey("userName")) sp.remove("userName");
    if (sp.containsKey("password")) sp.remove("password");
    if (sp.containsKey("rememberMe")) sp.remove("rememberMe");

      print("Info Deleted");
  }

  @override
  void initState() {
    super.initState();

    getLoginInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared preferences example")),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: txtUserName,
                        decoration: InputDecoration(hintText: "User Name")),
                    TextFormField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Passord")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Remember Me?"),
                        Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            }),
                        ElevatedButton(
                            onPressed: () async {
                              if (rememberMe) {
                                await setLoginInfo();
                              } else {
                                await forgetMe();
                              }
                            },
                            child: Text("Login"))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
