import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyPlagirism extends StatefulWidget{
  const MyPlagirism({Key?key}): super(key: key);

  @override
  _MyPlagirismState createState() => _MyPlagirismState();
}

class _MyPlagirismState extends State<MyPlagirism>{
  String text1 = "";
  String text2 = "";
  dynamic percent = "";

  void get_percent() async{
    final url = 'http://10.0.2.2:5000/plagirism';
    final dynamic send = await http.post(Uri.parse(url), body: json.encode({
      'text1': text1,
      'text2': text2,
    }));
    final decoded = json.decode(send.body) as Map<String, dynamic>;
    percent = decoded['percent'];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white70,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: false,
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
              margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.11),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.lightBlueAccent,),
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.9,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.05,
                  left: 35,
                  right: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ℙ𝕝𝕒𝕘𝕚𝕣𝕚𝕤𝕞 ℂ𝕙𝕖𝕔𝕜",
                      style: TextStyle(
                        //color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        /*foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.5
                          ..color = Colors.black,*/
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10,),
                    Text("Enter text 1:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'text',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (temp) {
                          setState(() {
                            text1 = temp;
                            //print_on_screen();
                          });
                        },
                        onSubmitted: (String temp) { print("submitted");
                        setState(() {
                          text1 = temp;
                          print(text1);

                        });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Enter text 2:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'text',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (temp) {
                          setState(() {
                            text2 = temp;
                            //print_on_screen();
                          });
                        },
                        onSubmitted: (String temp) { print("submitted");
                        setState(() {
                          text2 = temp;
                          print(text2);
                        });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        height: 60,
                        width: 120,
                        color: Colors.transparent,
                        child: Text(
                          percent+"%",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                    RaisedButton(
                    onPressed: () {
                      setState(() {
                        get_percent();
                      });
                    },
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        width: 150,
                        height: 80,
                        alignment: Alignment.center,
                        child: Text(
                          "SUBMIT",
                          maxLines: 2,
                          style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          //child: floatingActionButton: FloatingActionButton(onPressed: none),
        ),

      ),
    );
  }

}
