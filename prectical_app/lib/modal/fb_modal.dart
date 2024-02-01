class MyModal {
  int id;
  String title;

  MyModal(this.id, this.title);

  factory MyModal.fromMap({required Map data}) =>
      MyModal(data['id'], data['title']);

  Map<String, dynamic> get toMap => {
        'id': id,
        'title': title,
      };
}
