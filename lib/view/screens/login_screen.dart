
// ignore_for_file: unused_import, deprecated_member_use

import 'package:et_tracking/controller/loginfun.dart';
import 'package:et_tracking/controller/sharedpfs.dart';
import 'package:flutter/material.dart';


class LOG extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}
const colorr = const Color(0xff046547);
class _LogState extends State<LOG> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  Future<void> checkhis() async{
    String em,pass;
    em=  await getemail();
    pass= await getpass();
    if(em != null || pass != null )
    {
      emailController.text=em;
      passwordController.text=pass;
    }
  }
@override
  void initState() {
    
    super.initState();
    checkhis();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/logo.png'),
                width: 300,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        // autofocus: true,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your E-mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                               Navigator.pushReplacementNamed(context, '/map_page');
                           // logIn(context , emailController.text , passwordController.text);
                         // checkstatus();
                          }
                        },
                        child: Text('Log In'),
                      ),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
