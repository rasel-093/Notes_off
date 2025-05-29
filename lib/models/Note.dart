class Note {
  String? title;
  String? description;
  int? time;

  Note({this.title, this.description, this.time});

  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['time'] = this.time;
    return data;
  }
}