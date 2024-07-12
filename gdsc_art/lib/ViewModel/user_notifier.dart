import 'package:flutter/foundation.dart';
import 'package:gdsc_artwork/model/DataModel/model.dart';

class UserNotifier extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
