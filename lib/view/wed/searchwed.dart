import 'package:et_tracking/model/carslistfile.dart';
import 'package:et_tracking/controller/movcamfun.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class Searchbarr extends StatefulWidget {
  const Searchbarr({Key key}) : super(key: key);

  @override
  _SearchbarrState createState() => _SearchbarrState();
}

class _SearchbarrState extends State<Searchbarr> {
  // List of items to be searched
  List list = carsnumber;

 // String _selectedItemText = "Our Selection Item";

  @override
  Widget build(BuildContext context) {
    return GFSearchBar(
            searchBoxInputDecoration: InputDecoration(
        //icon: Icon(Icons.search),
        suffixIcon:IconButton(icon: Icon(Icons.logout),onPressed: (){}),
        prefixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){}),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            71,
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            71,
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      searchList: list,
      searchQueryBuilder: (query, list) {
        return list
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      onItemSelected: (item) {
        setState(() {
          if(item !=null){movcam(item.toString());}
          else{print('null item');}
          
        });
      },
    );
  }
}
