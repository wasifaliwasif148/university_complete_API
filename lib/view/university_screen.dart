import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:university_api_view/contoller/Api.dart';
import 'package:university_api_view/model/university_model.dart';

class university extends StatefulWidget {
  final mulak;
  university(this.mulak);

  @override
  State<university> createState() => _universityState();
}

class _universityState extends State<university> {
  var finaldata;
  universityFunction() async {
    var data = await ApiManager.getApi(widget.mulak ?? "pakistan");
    finaldata = universityModelFromJson(jsonEncode(data));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    universityFunction();
  }

  Widget build(BuildContext context) {
    var md = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/hom1.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: finaldata == null
              ? Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage("asset/images/${finalimage(finaldata[0].name)}"),
                        fit: BoxFit.cover,
                      ),
                      height: md.height * 0.6,
                      width: md.width * 1,
                      color: Colors.pink,
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text(
                        "${finaldata[0].name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: md.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 60,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "${finaldata[0].webPages[0]}",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )),
                        SizedBox(width: md.width * 0.03),
                        Container(
                            height: 60,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "${finaldata[0].domains[0]}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        SizedBox(width: md.width * 0.03),
                        Container(
                            height: 60,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "${finaldata[0].alphaTwoCode}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ), 
                    SizedBox(height: 12),
                    ElevatedButton(onPressed: (){Navigator.pop(context);},
                    child: Text("Go Back")),
                    
                  ],
                ),
        ));
  }
}



finalimage(image){
var pic=image;
var finalimage;
if (pic=="Information Technology University, Lahore") {
  finalimage="usa.jpg";
}
else if(pic=="University of Petroleum and Energy Studies"){
finalimage="uk.jpg";
}
else if(pic== "Australian Correspondence Schools"){
finalimage= "final.jpg";
}
else if(pic=="Cégep de Saint-Jérôme"){
finalimage="canada.jpg";
}
else{
  finalimage="australia.jpg";
}
return finalimage;
}
