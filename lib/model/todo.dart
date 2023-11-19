class ToDo {
  int? id;
  String? name;
  String? detail;
  bool isComplete = false;

  ToDo({this.id, this.name, this.detail});

  ToDo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    detail = json['detail'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['isComplete'] = this.isComplete;
    return data;
  }
}
