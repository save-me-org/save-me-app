import 'package:flutter/foundation.dart';
import 'package:save_me_app/domain/people.dart';

class PeopleProvider with ChangeNotifier {
  final People _people = People.empty();

  People get people => _people;

  void updateLocation(PeopleLocation location){
    _people.location = location;
    notifyListeners();
  }

  void save() {
    //TODO: implement
  }
}
