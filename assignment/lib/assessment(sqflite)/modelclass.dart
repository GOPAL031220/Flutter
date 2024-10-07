class Bloodmodel {
  int? id;
  String? name;
  String? blood_group;
  String? contact;
  String? location;

  ToMap(){
    Map mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;
    mapping['blood_group'] = blood_group;
    mapping['contact'] = contact;
    mapping['location'] = location;
    return mapping;
  }
}