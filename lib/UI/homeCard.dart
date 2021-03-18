import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_nodejs_app/Animations/homeCardColors.dart';
import 'package:test_nodejs_app/UI/detailedCard.dart';

class homeCard extends StatefulWidget {
  String userName,title,note;
  homeCard({this.userName,this.title,this.note});
  @override
  _homeCardState createState() => _homeCardState(userName: userName,title: title,note: note);
}

class _homeCardState extends State<homeCard> {
  String userName,title,note;
  Color color = colorGenerator();
  _homeCardState({this.userName,this.title,this.note});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        showMenu(context: context, items: [
          PopupMenuItem(child: Center(child: Icon(Icons.delete_forever,)))
        ], position: RelativeRect.fromLTRB(0,1,1,1));
      },
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>detailedNote(title: title,userName: userName,note: note,color: color,)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xFFf9f871)
        ),
        width: MediaQuery.of(context).size.width*0.45,
        height: MediaQuery.of(context).size.height*0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(child: titleWidget(title),flex: 4,),
            Flexible(child: noteWidget(note),flex: 5,)
          ],
        ),
      ),
    );
  }

  Widget titleWidget(String title){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.elliptical(2, 1),right: Radius.elliptical(1, 2))
        ),
        child: Text(title,style: TextStyle(
          fontSize: 30,
          color: Color(0xFF121013),
          fontWeight: FontWeight.w400
          // fontFamily: "Pacifico"
        ),),
        height: MediaQuery.of(context).size.height*0.13,
      );
  }

  Widget noteWidget(String note){
    if(note.length>30){
      note = note.substring(0,30) + " ...";
    }
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.elliptical(2, 1),right: Radius.elliptical(1, 2))
      ),
      child: Text(note,style: TextStyle(
        letterSpacing: 2,
        color: Color(0xFF252525),
        fontSize: 20,
        // fontFamily: "Lobster2"
      ),),
    );
  }
}
