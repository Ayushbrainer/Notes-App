class Notes{
  List<Note> notes;

  Notes({this.notes});

  factory Notes.fromJSON(List<dynamic> json){
    List<Note> notesList = new List<Note>();
    notesList = json.map((e) => Note.fromJson(e)).toList();
    return Notes(notes: notesList);
  }
}



class Note {
  String sId;
  String userName;
  String title;
  String note;
  String date;
  int iV;

  Note({this.sId, this.userName, this.title, this.note, this.date, this.iV});

  Note.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    title = json['title'];
    note = json['note'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['title'] = this.title;
    data['note'] = this.note;
    data['date'] = this.date;
    return data;
  }
}
