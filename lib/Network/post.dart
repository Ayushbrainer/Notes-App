import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_nodejs_app/Network/Network.dart';
import 'package:test_nodejs_app/Network/PODO.dart';

class postClass{
  var hardData = {
    "userName":"Test 998",
    "title":"Test Title 232",
    "note":"Test Note 23 213 12 3",
    "date": DateTime.now().toIso8601String()
  };
  // var encode = jsonEncode(hardData);
  var url = "http://localhost:3000/notes";
  Future postData(Note note) async{
    Response response = await Dio().post("https://boiling-sands-08961.herokuapp.com/notes",options: Options(
      contentType: Headers.formUrlEncodedContentType
    ),data:note.toJson());

    print(response.statusCode);
    return response.statusCode;
  }

  Future<int> updateData(Note note) async{
    Note newNote = Note(
      note: note.note,
      title: note.title,
      date: note.date,
    );
    print('https://boiling-sands-08961.herokuapp.com/'+note.date);
    Response response = await Dio().put('https://boiling-sands-08961.herokuapp.com/'+note.date,data: newNote.toJson(),options: Options(
      contentType: Headers.formUrlEncodedContentType
    ));

    print(response.statusCode);
    return response.statusCode;


  }
}