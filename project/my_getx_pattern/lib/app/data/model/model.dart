class MyModel {
  int id;
  String title;
  String body;

  MyModel({required this.id, required this.title, required this.body});

  MyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'] {
          
        }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
