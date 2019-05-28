class Person {
  String name;
  int age;
  String head;



  Person({this.name, this.age, this.head});

  Person.fromJson(Map json) {
    this.name = json['name'];
    this.age = json['age'];
  }

  say() {
    assert(name == null);
    print('我叫$name');
  }
}
