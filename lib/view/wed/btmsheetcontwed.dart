

import 'package:et_tracking/model/carslistfile.dart';
import 'package:flutter/material.dart';


class BtmCont extends StatefulWidget {
  @override
  _BtmContState createState() => _BtmContState();
}

class _BtmContState extends State<BtmCont> {

  @override
  void initState() {
    super.initState();
    _getnums();
  }

  int eon=0, eoff=0, idi=0, notrep=0, wh=0;
  void _getnums() {
    setState(() {
    eon = getonnum();
    eoff = getoffnum();
    idi = getidinum();
    notrep = getnotrep();
    wh = getwhnum();
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: const Radius.circular(50),
              topLeft: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children:[
                Expanded(child: TextButton(onPressed: (){}, child: Text('Engine\nOff\n$eoff',textAlign: TextAlign.center,style: TextStyle(color: Colors.red),))),
                VerticalDivider(color: Colors.grey,width: 1,thickness: 1,indent: 10,endIndent: 10,),
                Expanded(child: TextButton(onPressed: (){}, child: Text('Engine\nOn\n$eon',textAlign: TextAlign.center,style: TextStyle(color: Colors.green),))),
                VerticalDivider(color: Colors.grey,width: 1,thickness: 1,indent: 10,endIndent: 10,),
                Expanded(child: TextButton(onPressed: (){}, child: Text('Idiling\n\n$idi',textAlign: TextAlign.center,style: TextStyle(color: Colors.yellow),))),
                VerticalDivider(color: Colors.grey,width: 1,thickness: 1,indent: 10,endIndent: 10,),
                Expanded(child: TextButton(onPressed: (){}, child: Text('Moving out Working Hours\n$wh',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue),))),
                VerticalDivider(color: Colors.grey,width: 1,thickness: 1,indent: 10,endIndent: 10,),
                Expanded(child: TextButton(onPressed: (){}, child: Text('Not Reporting\n$notrep',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),))),          
        ]
      ),
    );
  }

}
