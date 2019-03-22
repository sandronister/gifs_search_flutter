import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search; 
  int _offset;

  Future<Map> _getGifs() async{
    http.Response response;

    if(_search !=null)
      response = await http.get('https://api.giphy.com/v1/gifs/search?api_key=211nyf45JtJjGROFOHv6LY7HQifKSjKK&q=$_search&limit=25&offset=$_offset&rating=G&lang=en');
    else
      response = await http.get('https://api.giphy.com/v1/gifs/trending?api_key=211nyf45JtJjGROFOHv6LY7HQifKSjKK&limit=25&rating=G');

    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((map){
      print(map);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}