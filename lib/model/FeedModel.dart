class FeedModel {
  String id;
  int collection;
  Permissions permissions;
  String name;
  int dateCreated;
  int dateUpdated;
  bool structure;
  int sum;
  List<Documents> documents;

  FeedModel(
      {this.id,
        this.collection,
        this.permissions,
        this.name,
        this.dateCreated,
        this.dateUpdated,
        this.structure,
        this.sum,
        this.documents});

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    collection = json['\$collection'];
    permissions = json['\$permissions'] != null
        ? new Permissions.fromJson(json['\$permissions'])
        : null;
    name = json['name'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    structure = json['structure'];
    sum = json['sum'];
    if (json['documents'] != null) {
      documents = new List<Documents>();
      json['documents'].forEach((v) {
        documents.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this.id;
    data['\$collection'] = this.collection;
    if (this.permissions != null) {
      data['\$permissions'] = this.permissions.toJson();
    }
    data['name'] = this.name;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['structure'] = this.structure;
    data['sum'] = this.sum;
    if (this.documents != null) {
      data['documents'] = this.documents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  List<String> read;
  List<String> write;

  Permissions({this.read, this.write});

  Permissions.fromJson(Map<String, dynamic> json) {
    read = json['read'].cast<String>();
    write = json['write'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read'] = this.read;
    data['write'] = this.write;
    return data;
  }
}

class Documents {
  String id;
  String collection;
  Permissions permissions;
  String caption;
  String url;
  String type;

  Documents(
      {this.id,
        this.collection,
        this.permissions,
        this.caption,
        this.url,
        this.type});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    collection = json['\$collection'];
    permissions = json['\$permissions'] != null
        ? new Permissions.fromJson(json['\$permissions'])
        : null;
    caption = json['caption'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this.id;
    data['\$collection'] = this.collection;
    if (this.permissions != null) {
      data['\$permissions'] = this.permissions.toJson();
    }
    data['caption'] = this.caption;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}
