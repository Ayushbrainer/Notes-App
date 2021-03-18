import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:test_nodejs_app/Network/PODO.dart';
import 'package:test_nodejs_app/Network/postModel.dart';

class Network{
  final String url = "https://boiling-sands-08961.herokuapp.com/notes";

  Future<Notes> fetchData() async{
    Response response = await get(Uri.encodeFull(url));
    print('got ${response.statusCode}');

    if(response.statusCode==200){
      print("Data Fetch Successful");
      return Notes.fromJSON(json.decode(response.body));
    }else{
      throw Exception("There was an error fetching data from server");
    }

  }

 // Future postNote() async{
 //    sendNote note = new sendNote(
 //      userName: "Test USer 3",
 //      note: "Test Note 3",
 //      title: "Test Title 3",
 //      date: DateTime.now().toIso8601String()
 //    );
 //    var encodedBody = jsonEncode(note.toJSON());
 //    print(jsonEncode(note.toJSON()));
 //
 //    Response response = await post(Uri.http('localhost:3000', 'notes'),body: jsonEncode(note.toJSON()),headers: {
 //      "Accept": "application/json",
 //      "Content-Type": "application/json"
 //    });
 //
 //    print(response.statusCode);
 // }
}