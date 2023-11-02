class Student {

  int id;
  String name;
  String course;
  int age ;

  Student(
      this.name,
      this.course,
      this.age,{
        this.id = 0,
  }
      );

  factory Student.fromMap({required Map Data}){
    return Student(
        Data['name'],
        Data['course'],
        Data['age'],
      id: Data['id']
    );

  }


  Map<String,dynamic> get toMap {

    return {
      'name':name,
      'course': course,
      'age':age,
    };

  }




}