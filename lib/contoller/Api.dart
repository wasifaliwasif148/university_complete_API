import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiManager{

static getApi(mulak)async{
try {
  var country=await http.get(Uri.parse("http://universities.hipolabs.com/search?country=$mulak"));
var finalcountry=jsonDecode(country.body);
return finalcountry;
} catch (e) {
  print(e);
}

}

}

//http://universities.hipolabs.com/search?country=pakistan