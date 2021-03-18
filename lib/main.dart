import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_nodejs_app/UI/homeCard.dart';
import 'package:test_nodejs_app/UI/newNote.dart';
import 'Network/Network.dart';
import 'Network/PODO.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent
    )
  ),
      home: homePage(),
      debugShowCheckedModeBanner: false,
    ));

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future<Notes> data;
  String lorem = "";

  Future<Null> refresh() async{
    await Future.delayed(Duration(seconds: 4));
    Network network = new Network();
    setState(() {
      data = network.fetchData();
    });
  }

  @override
  void initState(){
    // TODO: implement initState
    Network network = new Network();
    data = network.fetchData();
    print('OK');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App",style: TextStyle(
          fontSize: 30,
          fontFamily: "Akaya",
          color: Color(0xFFdddddd),
        ),),
        elevation: 0.0,
        backgroundColor: Color(0xFF008891),
        actions: [
          IconButton(icon: Icon(Icons.search,color: Color(0xFFf6f6f6),size: 40,), onPressed: (){})
        ],
      ),
      backgroundColor: Color(0xFF008891),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FutureBuilder(
            future: data,
            builder: (context,AsyncSnapshot<Notes> snapshot){
              if(snapshot.hasData){
                print("Successfully fetched data");
                // return CircularProgressIndicator();
                return viewBuilder(snapshot.data.notes, context);

              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.00,
        onPressed: () {
          Navigator.push(context, PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 250),
              pageBuilder: (context,animation,animationTime){
            return page();
          },
            transitionsBuilder: transition
          ),);
        },
        backgroundColor: Colors.grey,
      ),
    );

  }


  Widget transition (context,animation,animationTime,child){
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.center,
      child: child,
    );
  }

  Widget viewBuilder(List<Note> notes, BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2.0, crossAxisSpacing: 2.0),
      itemBuilder: (context, index) {
        return homeCard(
          title: notes[index].title,
          note: notes[index].note,
          userName: notes[index].userName,
        );
      },
      itemCount: notes.length,
    );
  }
}
