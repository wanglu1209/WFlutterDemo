import 'package:flutter/material.dart';

import 'Person.dart';

class PersonNotifier extends ValueNotifier<Person>{
  PersonNotifier(Person value) : super(value);

  void changePersonName(String name){
    value.name = name;
    notifyListeners();
  }
}