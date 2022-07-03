import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:ds_project/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyChoice extends StatefulWidget{
  const MyChoice({Key?key}): super(key: key);

  @override
  _MyChoiceState createState() => _MyChoiceState();
}

class _MyChoiceState extends State<MyChoice>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white70,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text("ADS PROJECT", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Marquee(
                text: 'Welcome to the our Data Structure project!! ',
                style: TextStyle(fontSize: 18, color: Colors.black),
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.4, left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.lightBlueAccent,),
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.5,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.05,
                  left: 35,
                  right: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25,),
                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, 'homepage'),
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          width: 150,
                          height: 80,
                          alignment: Alignment.center,
                          child: Text(
                            "𝕋𝕖𝕩𝕥 𝕊𝕦𝕘𝕘𝕖𝕤𝕥𝕖𝕣",
                            maxLines: 2,
                            style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                          )
                      ),
                    ),

                    SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, 'plagirism'),
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          width: 150,
                          height: 80,
                          alignment: Alignment.center,
                          child: Text(
                            "ℙ𝕝𝕒𝕘𝕚𝕣𝕚𝕤𝕞 ℂ𝕙𝕖𝕔𝕜",
                            maxLines: 2,
                            style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, 'spelling'),
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          width: 150,
                          height: 80,
                          alignment: Alignment.center,
                          child: Text(
                            "𝕊𝕡𝕖𝕝𝕝 ℂ𝕙𝕖𝕔𝕜𝕖𝕣",
                            maxLines: 2,
                            style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7),
                  child: Text("            Developed by \n               A. Anand \n                      & \n        Anush Rajagopalan",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                  ),
              ),
            )
          ],
          //child: floatingActionButton: FloatingActionButton(onPressed: none),
        ),

      ),
    );
  }
}

