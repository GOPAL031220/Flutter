class Taskmodel {
  int? id;
  String? name;
  String? description;
  String? date;
  String? time;
  String? priority;
  int? is_complete = 0;

  TaskMap(){
    Map mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;
    mapping['description'] = description;
    mapping['date'] = date;
    mapping['time'] = time;
    mapping['priority'] = priority;
    mapping['is_complete'] = 0;

    return mapping;
  }

  @override
  String toString() {
    return 'Taskmodel{id: $id, name: $name, description: $description, date: $date, time: $time, priority: $priority, is_complete: $is_complete}';
  }
}