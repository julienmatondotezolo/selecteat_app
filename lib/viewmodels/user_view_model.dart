import 'package:selecteat_app/utils/extensions.dart';

class UserViewModel {
  final _user;

  UserViewModel({required user}) : _user = user;

  String get uid {
    return _user.uid;
  }

  String get email {
    return _user.email;
  }

  String get name {
    print(_user.name);
    return _user.name;
  }

  String get firstname {
    return _user.firstname;
  }
}
