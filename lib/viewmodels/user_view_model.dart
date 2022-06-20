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
    var username = _user.name;
    if (username.length > 0)
      return username[0].toUpperCase() + username.substring(1).toLowerCase();
    return username;
  }

  String get firstname {
    var firstname = _user.firstname;
    if (firstname.length > 0)
      return firstname[0].toUpperCase() + firstname.substring(1).toLowerCase();
    return firstname;
  }

  String get initials {
    var username = _user.name;
    var firstname = _user.firstname;
    var initials = firstname[0].toUpperCase() + username[0].toUpperCase();
    return initials;
  }
}
