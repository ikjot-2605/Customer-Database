import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  void setDetailsAdmin() async {
    print('getting');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nameFound = prefs.getString('admin_name');
    print(nameFound);
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
  @override
  Widget build(BuildContext context) {
    setDetailsAdmin();
    return Scaffold(
      appBar: AppBar(title: Text('Register as an Admin')),
      body: Form(
        autovalidate: _autovalidate,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              child: TextFormField(
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
                  labelText: ' Roll No./Email',
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
                child: Text("Sign In"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _removeKeyboard(context);
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
            const SizedBox(height: 16),
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
