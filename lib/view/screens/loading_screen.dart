
import 'package:et_tracking/controller/checkconfun.dart';
import 'package:et_tracking/controller/sharedpfs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LOD extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const colorr = const Color(0xff046547);

class _HomeState extends State<LOD> {
  Future<void> checkLoginStatus() async {
    String em,pass,tok;
    em=  await getemail();
    pass= await getpass();
    tok = await gettoken();
    if (tok == null ||em == null ||pass== null) {
      Navigator.pushReplacementNamed(context, '/login_page');
    } else {
      Navigator.pushReplacementNamed(context, '/map_page');
    }
  }

  Future<void> checkstatus() async {
    bool net = await checkcon();
    if (net == false) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Connection failed !!"),
              content: Text("Check your Network"),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text("Try again"),
                ),
              ],
            );
          });
    } else {
      checkLoginStatus();
    }
  }

  @override
  void initState() {
    super.initState();
    checkstatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorr,
      body: Center(
        child: SpinKitRing(
          color: Colors.blue[300],
          size: 50.0,
        ),
      ),
    );
  }
}
