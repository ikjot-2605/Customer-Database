import 'package:customer_database/presentation/admin_login_page.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminRegisterPage extends StatefulWidget {
  @override
  _AdminRegisterPageState createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _roleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void setDetailsAdmin(
      String name, String role, String description, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('admin_name');
    await prefs.setString('admin_name', name);
    await prefs.setString('admin_password', password);
    await prefs.setString('admin_role', role);
    await prefs.setString('admin_description', description);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AdminLoginPage()));
  }

  _removeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Color kBlue = Color(0xFF6770D2);
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register as an Admin',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        // ignore: deprecated_member_use
        autovalidate: _autovalidate,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              'Hi, to register as an admin, please fill in the following.',
              style: TextStyle(height: 14, letterSpacing: 1.0),
            )),
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              child: TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    _autovalidate = true;
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: kBlue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]
                          : Color(0xffDCDCDC),
                      width: 2,
                    ),
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFF767676),
                      fontSize: 14),
                ),
                autocorrect: false,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              child: TextFormField(
                controller: _roleController,
                validator: (value) {
                  if (value.isEmpty) {
                    _autovalidate = true;
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: kBlue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]
                          : Color(0xffDCDCDC),
                      width: 2,
                    ),
                  ),
                  labelText: 'Role',
                  labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFF767676),
                      fontSize: 14),
                ),
                autocorrect: false,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              child: TextFormField(
                controller: _descriptionController,
                validator: (value) {
                  if (value.isEmpty) {
                    _autovalidate = true;
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: kBlue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]
                          : Color(0xffDCDCDC),
                      width: 2,
                    ),
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFF767676),
                      fontSize: 14),
                ),
                autocorrect: false,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              child: TextFormField(
                controller: _passwordController,
                obscureText: obscure,
                validator: (value) {
                  _autovalidate = true;
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                // controller: passwordController,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: kBlue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]
                          : Color(0xffDCDCDC),
                      width: 2,
                    ),
                  ),
                  labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFF767676),
                      fontSize: 14),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
                autocorrect: false,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: obscure,
                validator: (value) {
                  _autovalidate = true;
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                // controller: passwordController,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: kBlue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]
                          : Color(0xffDCDCDC),
                      width: 2,
                    ),
                  ),
                  labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFF767676),
                      fontSize: 14),
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
                autocorrect: false,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 1.15,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                textColor: Colors.white,
                child: Text("Register"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _removeKeyboard(context);
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      setDetailsAdmin(
                          _nameController.text,
                          _roleController.text,
                          _descriptionController.text,
                          _passwordController.text);
                    } else {
                      Flushbar(
                        title: "Password Issue",
                        message:
                            "Please Ensure Your Password and Confirmed Password are the same.",
                        duration: Duration(seconds: 3),
                      )..show(context);
                    }
                  }
                },
                color: kBlue,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(
                    'Recover Password',
                    style: TextStyle(
                      color: Colors.blue[500],
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "OR",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.blueGrey),
                ),
                horizontalLine(context)
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget horizontalLine(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 4,
          height: 1,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black12.withOpacity(1),
        ),
      );
}
