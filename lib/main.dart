import 'package:customer_database/presentation/admin_login_page.dart';
import 'package:customer_database/presentation/admin_register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> futureName;
  Future<String> fetchDetailsAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('admin_name');
    return name;
  }

  void setDetailsAdmin(
      String name, String password, String role, String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('admin_name');
    await prefs.setString('admin_name', name);
    await prefs.setString('admin_password', password);
    await prefs.setString('admin_role', role);
    await prefs.setString('admin_description', description);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchDetailsAdmin(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          if (snapshot.data == null) {
            return AdminRegisterPage();
          } else {
            return AdminLoginPage();
          }
        } else if (snapshot.hasError) {
          return AdminRegisterPage();
        } else if (snapshot.data == null) {
          return AdminRegisterPage();
        }
      },
    );
  }
}
