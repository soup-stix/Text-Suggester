import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MySpelling extends StatefulWidget{
  const MySpelling({Key?key}): super(key: key);

  @override
  _MySpellingState createState() => _MySpellingState();
}

class _MySpellingState extends State<MySpelling>{
  String text = "";
  dynamic word_list_avl;
  var final_string_avl;
  dynamic word_list_splay;
  var final_string_splay;
  dynamic word_list_rb;
  var final_string_rb;
  dynamic word_list_btree;
  var final_string_btree;

  void get_spelling() async{
    final url = 'http://10.0.2.2:5000/spells';
    final dynamic send = await http.post(Uri.parse(url), body: json.encode({
      'text': text,
    }));
    final decoded = json.decode(send.body) as Map<String, dynamic>;
    print(decoded['spells_avl']);
    print(decoded['spells_splay']);
    print(decoded['spells_rb']);
    print(decoded['spells_btree']);
    word_list_avl = decoded['spells_avl'];
    final_string_avl = word_list_avl.join("");
    print(word_list_avl);
    word_list_splay = decoded['spells_splay'];
    final_string_splay = word_list_splay.join("");
    print(word_list_splay);
    word_list_rb = decoded['spells_rb'];
    final_string_rb = word_list_rb.join("");
    print(word_list_rb);
    word_list_btree = decoded['spells_btree'];
    final_string_btree = word_list_btree.join("");
    print(word_list_btree);
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
                      "𝐒𝐩𝐞𝐥𝐥 𝐂𝐡𝐞𝐜𝐤𝐞𝐫",
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
                    Text("Enter text:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
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
                            text = temp;
                            print(text);
                            get_spelling();
                            //print_on_screen();
                          });
                        },
                        onSubmitted: (String temp) { print("submitted");
                        setState(() {
                          text = temp;
                          print(text);
                          get_spelling();
                        });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Check these words:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),

                    SizedBox(height: 10,),
                    Text("AVL Tree:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintMaxLines: 5,
                          hintText: final_string_avl,
                          hintStyle: TextStyle(color: Colors.black,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("SPLAY Tree:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintMaxLines: 5,
                          hintText: final_string_splay,
                          hintStyle: TextStyle(color: Colors.black,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("RB Tree:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintMaxLines: 5,
                          hintText: final_string_rb,
                          hintStyle: TextStyle(color: Colors.black,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("BTREE Tree:",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintMaxLines: 5,
                          hintText: final_string_btree,
                          hintStyle: TextStyle(color: Colors.black,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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

