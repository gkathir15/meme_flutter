//{
//"$id": "5f1db6468145d",
//"$collection": "5f1db344c2279",
//"$permissions": {
//"read": [
//"*"
//],
//"write": [
//"*"
//]
//},
//"type": "youtube",
//"url": "https://www.youtube.com/watch?v=i4_EZ8enqHs",
//"category": "funny",
//"caption": "eX",
//"owner": "fhew44",
//"upvote": 0,
//"isMature": false,
//"timestamp": 372093742
//}


class PostsCollectionResponse {
  String _id;
  int _collection;
  Permissions _permissions;
  String _name;
  int _dateCreated;
  int _dateUpdated;
  bool _structure;
  int _sum;
  List<Documents> _documents;

  PostsCollectionResponse(
      {String id,
        int collection,
        Permissions permissions,
        String name,
        int dateCreated,
        int dateUpdated,
        bool structure,
        int sum,
        List<Documents> documents}) {
    this._id = id;
    this._collection = collection;
    this._permissions = permissions;
    this._name = name;
    this._dateCreated = dateCreated;
    this._dateUpdated = dateUpdated;
    this._structure = structure;
    this._sum = sum;
    this._documents = documents;
  }

  String get id => _id;
  set id(String id) => _id = id;
  int get collection => _collection;
  set collection(int collection) => _collection = collection;
  Permissions get permissions => _permissions;
  set permissions(Permissions permissions) => _permissions = permissions;
  String get name => _name;
  set name(String name) => _name = name;
  int get dateCreated => _dateCreated;
  set dateCreated(int dateCreated) => _dateCreated = dateCreated;
  int get dateUpdated => _dateUpdated;
  set dateUpdated(int dateUpdated) => _dateUpdated = dateUpdated;
  bool get structure => _structure;
  set structure(bool structure) => _structure = structure;
  int get sum => _sum;
  set sum(int sum) => _sum = sum;
  List<Documents> get documents => _documents;
  set documents(List<Documents> documents) => _documents = documents;

  PostsCollectionResponse.fromJson(Map<String, dynamic> json) {
    _id = json['\$id'];
    _collection = json['\$collection'];
    _permissions = json['\$permissions'] != null
        ? new Permissions.fromJson(json['\$permissions'])
        : null;
    _name = json['name'];
    _dateCreated = json['dateCreated'];
    _dateUpdated = json['dateUpdated'];
    _structure = json['structure'];
    _sum = json['sum'];
    if (json['documents'] != null) {
      _documents = new List<Documents>();
      json['documents'].forEach((v) {
        _documents.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this._id;
    data['\$collection'] = this._collection;
    if (this._permissions != null) {
      data['\$permissions'] = this._permissions.toJson();
    }
    data['name'] = this._name;
    data['dateCreated'] = this._dateCreated;
    data['dateUpdated'] = this._dateUpdated;
    data['structure'] = this._structure;
    data['sum'] = this._sum;
    if (this._documents != null) {
      data['documents'] = this._documents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  List<String> _read;
  List<String> _write;

  Permissions({List<String> read, List<String> write}) {
    this._read = read;
    this._write = write;
  }

  List<String> get read => _read;
  set read(List<String> read) => _read = read;
  List<String> get write => _write;
  set write(List<String> write) => _write = write;

  Permissions.fromJson(Map<String, dynamic> json) {
    _read = json['read'].cast<String>();
    _write = json['write'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read'] = this._read;
    data['write'] = this._write;
    return data;
  }
}

class Documents {
  String _id;
  String _collection;
  Permissions _permissions;
  String _type;
  String _owner;
  String _categroy;
  int _timestamp;
  String _src;
  int _upvote;
  bool _isMature;
  String _caption;

  Documents(
      {String id,
        String collection,
        Permissions permissions,
        String type,
        String owner,
        String categroy,
        int timestamp,
        String src,
        int upvote,
        bool isMature,
        String caption}) {
    this._id = id;
    this._collection = collection;
    this._permissions = permissions;
    this._type = type;
    this._owner = owner;
    this._categroy = categroy;
    this._timestamp = timestamp;
    this._src = src;
    this._upvote = upvote;
    this._isMature = isMature;
    this._caption = caption;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get collection => _collection;
  set collection(String collection) => _collection = collection;
  Permissions get permissions => _permissions;
  set permissions(Permissions permissions) => _permissions = permissions;
  String get type => _type;
  set type(String type) => _type = type;
  String get owner => _owner;
  set owner(String owner) => _owner = owner;
  String get categroy => _categroy;
  set categroy(String categroy) => _categroy = categroy;
  int get timestamp => _timestamp;
  set timestamp(int timestamp) => _timestamp = timestamp;
  String get src => _src;
  set src(String src) => _src = src;
  int get upvote => _upvote;
  set upvote(int upvote) => _upvote = upvote;
  bool get isMature => _isMature;
  set isMature(bool isMature) => _isMature = isMature;
  String get caption => _caption;
  set caption(String caption) => _caption = caption;

  Documents.fromJson(Map<String, dynamic> json) {
    _id = json['\$id'];
    _collection = json['\$collection'];
    _permissions = json['\$permissions'] != null
        ? new Permissions.fromJson(json['\$permissions'])
        : null;
    _type = json['type'];
    _owner = json['owner'];
    _categroy = json['category'];
    _timestamp = json['timestamp'];
    _src = json['url'];
    _upvote = json['upvote'];
    _isMature = json['isMature'];
    _caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this._id;
    data['\$collection'] = this._collection;
    if (this._permissions != null) {
      data['\$permissions'] = this._permissions.toJson();
    }
    data['type'] = this._type;
    data['owner'] = this._owner;
    data['category'] = this._categroy;
    data['timestamp'] = this._timestamp;
    data['url'] = this._src;
    data['upvote'] = this._upvote;
    data['isMature'] = this._isMature;
    data['caption'] = this._caption;
    return data;
  }
}
