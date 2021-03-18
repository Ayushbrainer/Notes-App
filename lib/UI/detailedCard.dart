import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_nodejs_app/Animations/animating_page.dart';
import 'package:test_nodejs_app/Network/PODO.dart';
import 'package:test_nodejs_app/UI/updateCard.dart';

class detailedNote extends StatefulWidget {
  String title,note,userName;
  Color color;
  detailedNote({this.title,this.note,this.userName,this.color});
  @override
  _detailedNoteState createState() => _detailedNoteState(title: title,note: note,userName: userName,color: color);
}

class _detailedNoteState extends State<detailedNote> with SingleTickerProviderStateMixin{
  String title,note,userName;
  Color color;
  _detailedNoteState({this.title,this.note,this.userName,this.color});
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 1200),vsync: this);

    final curvedAnimation = CurvedAnimation(
        curve: Curves.bounceOut,
        reverseCurve: Curves.easeOutCubic,
        parent: animationController
    );

    animation = Tween<double>(begin:0 ,end: 1)
        .animate(curvedAnimation);
    animationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        elevation: 0.0,
        backgroundColor: Color(0xFF008891),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>updatePage(currentNote: Note(
              note: note,
              userName: userName,
              title: title,
              date: DateTime.now().toIso8601String()
            ),)));
          })
        ],
      ),
      body: ListView(
        children: [
          animated_Image(angle: animation, child: titleView(title)),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(13),
            height: 1,
            color: Colors.black,
          ),
          animated_Image(angle: animation, child: noteView(note)),
          SizedBox(height: 20,),
        ],
      ),
      bottomSheet: animated_Image(angle: animation, child:
      Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width*0.8,),
          usernameView(userName)
        ],
      )
      ),
      backgroundColor: Color(0xFF008891),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  Widget titleView(String title){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(title,textAlign: TextAlign.start,
      style: TextStyle(
        // fontFamily: "Pacifico",
        fontSize: 30,
        letterSpacing: 1.1,
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),),
    );
  }

  Widget noteView(String note){
    return Container(
      alignment: Alignment.centerLeft,
     padding: EdgeInsets.only(left:0,right: 10,bottom: 0),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Text(
        note,
        textAlign: TextAlign.start,
        style: TextStyle(
      // fontFamily: "Courgette",
      fontSize: 25,
       letterSpacing: 1.1,
      color: Color(0xFFf4f9f9),
          textBaseline: TextBaseline.alphabetic
        ),
      ),
    );
  }

  Widget usernameView(String userName){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
        ),
        child: Text(
          userName,
          textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFfc8621),fontSize: 15
        ),
        ),
      ),
    );
  }
}
