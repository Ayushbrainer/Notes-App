import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_nodejs_app/Network/Network.dart';
import 'package:test_nodejs_app/Network/PODO.dart';
import 'package:test_nodejs_app/Network/post.dart';



class page extends StatefulWidget {
  @override
  _pageState createState() => _pageState();
}

class _pageState extends State<page> {
  TextEditingController title = new TextEditingController(),
      note = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF845ec2),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Make A New Note !",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 31,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          titleMaker(context),
          noteMaker(context),
        ],
      ),
      floatingActionButton: Builder(
        builder:(context) => FloatingActionButton(
          onPressed: (){
            if(title.text=="" && note.text==""){
              final snackbar = SnackBar(content: Text("Please write something to save"),backgroundColor: Colors.yellow,duration: Duration(seconds: 2),);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }else{
              postClass post = postClass();
              var code = post.postData(Note(
                  title: title.text,
                  note: note.text,
                  date: DateTime.now().toIso8601String(),
                userName: "TEst Admin 1"
              ));
              final snackbar = SnackBar(content: Text("Note Saved succesfully"),backgroundColor: Colors.green,duration: Duration(seconds: 2),);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);

            }
            // Network network = Network();
            // network.postNote();


          },
          child: Icon(Icons.save),
        ),
      ),
    );
  }

  Widget noteMaker(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      child: TextFormField(
        controller: note,
        maxLines: 8,
        decoration: InputDecoration(
          labelText: "Your Note",
          labelStyle:
          TextStyle(color: Color(0xFF65d6ce), fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.all(12.2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF65d6ce), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF65d6ce), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
    );
  }

  Widget titleMaker(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: title,
        decoration: InputDecoration(
          labelText: "Title of the note",
          labelStyle:
          TextStyle(color: Color(0xFF65d6ce), fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.all(12.2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF65d6ce), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF65d6ce), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
    );
  }

}









