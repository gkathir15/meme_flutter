class UserData {
  String _id;
  String _email;
  bool _emailVerification;
  int _status;
  int _registration;
  String _name;
  List<String> _roles;

  UserData(
      {String id,
        String email,
        bool emailVerification,
        int status,
        int registration,
        String name,
        List<String> roles}) {
    this._id = id;
    this._email = email;
    this._emailVerification = emailVerification;
    this._status = status;
    this._registration = registration;
    this._name = name;
    this._roles = roles;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get email => _email;
  set email(String email) => _email = email;
  bool get emailVerification => _emailVerification;
  set emailVerification(bool emailVerification) =>
      _emailVerification = emailVerification;
  int get status => _status;
  set status(int status) => _status = status;
  int get registration => _registration;
  set registration(int registration) => _registration = registration;
  String get name => _name;
  set name(String name) => _name = name;
  List<String> get roles => _roles;
  set roles(List<String> roles) => _roles = roles;

  UserData.fromJson(Map<String, dynamic> json) {
    _id = json['\$id'];
    _email = json['email'];
    _emailVerification = json['emailVerification'];
    _status = json['status'];
    _registration = json['registration'];
    _name = json['name'];
    if(json['roles']!=null)
    _roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this._id;
    data['email'] = this._email;
    data['emailVerification'] = this._emailVerification;
    data['status'] = this._status;
    data['registration'] = this._registration;
    data['name'] = this._name;
    data['roles'] = this._roles;
    return data;
  }
}
