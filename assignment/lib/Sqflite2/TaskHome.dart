import 'package:assignment/Sqflite2/modelclass.dart';
import 'package:assignment/Sqflite2/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Taskhome extends StatefulWidget {
  const Taskhome({super.key});
  State<Taskhome> createState() => _TaskhomeState();
}

class _TaskhomeState extends State<Taskhome> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedPriority;

  Taskmodel _taskmodel = Taskmodel();
  Repository _repository = Repository();

  _showFormDialogue(BuildContext context, {Taskmodel? task}) {
    if (task != null) {
      _taskNameController.text = task.name ?? '';
      _taskDescriptionController.text = task.description ?? '';
      _selectedDate = task.date != null ? DateFormat('dd-MM-yyyy').parse(task.date!) : null;
    // _selectedTime = task.time != null ? TimeOfDay.fromDateTime(DateFormat.jm().parse(task.time!)) : null;
    // print('time ${_selectedTime}');
      _selectedPriority = task.priority;
      print('task : $task');
    }

    return showDialog(
      context: context,
      builder: (param) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              actions: [
                OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    _taskmodel.name = _taskNameController.text.isNotEmpty ? _taskNameController.text : '(no title)';
                    _taskmodel.description = _taskDescriptionController.text.isNotEmpty ? _taskDescriptionController.text : '(no description)';
                    _taskmodel.date = _selectedDate != null
                        ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                        : null;
                    _taskmodel.time = _selectedTime != null
                        ? _selectedTime!.format(context)
                        : null;
                    _taskmodel.priority = _selectedPriority;

                    if (task == null) {
                      _repository.insertData('Tasks', _taskmodel.TaskMap());
                    } else {
                      _taskmodel.id  = task.id;
                      _repository.updateData('Tasks',_taskmodel.TaskMap());
                    }
                    getAllTasks();
                    _taskNameController.clear();
                    _taskDescriptionController.clear();
                    _selectedDate = null;
                    _selectedTime = null;
                    _selectedPriority = null;
                  },
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _taskNameController.clear();
                    _taskDescriptionController.clear();
                    _selectedDate = null;
                    _selectedTime = null;
                    _selectedPriority = null;
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ),
              ],
              title: Text('Task Details'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _taskNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Title',
                      ),
                    ),
                    TextField(
                      controller: _taskDescriptionController,
                      decoration: InputDecoration(
                        hintText: 'Enter Description',
                      ),
                    ),
                    ListTile(
                      title: Text(_selectedDate == null
                          ? 'Select Date'
                          : DateFormat('dd-MM-yyyy').format(_selectedDate!)),
                      trailing: Icon(Icons.calendar_today),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        setDialogState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                    ),
                    ListTile(
                      title: Text(_selectedTime == null
                          ? 'Select Time'
                          : _selectedTime!.format(context)),
                      trailing: Icon(Icons.access_time),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        setDialogState(() {
                          _selectedTime = pickedTime;
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      value: _selectedPriority,
                      items: ['Low', 'Medium', 'High'].map((priority) {
                        return DropdownMenuItem<String>(
                          value: priority,
                          child: Text(priority),
                        );
                      }).toList(),
                      hint: Text('Priority'),
                      onChanged: (value) {
                        setDialogState(() {
                          _selectedPriority = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
  void initState(){
    super.initState();
    getAllTasks();
  }
  List<Taskmodel> _categoryList = [];
  getAllTasks() async {
    _categoryList.clear();
    List categories = await _repository.readData('Tasks');
    categories.forEach((cat){
      setState(() {
        var c = Taskmodel();
        c.id = cat['id'];
        c.name = cat['name'];
        c.description = cat['description'];
        c.date = cat['date'];
        c.time = cat['time'];
        c.priority = cat['priority'];
        c.is_complete = cat['is_complete'];
        _categoryList.add(c);
        _categoryList.sort((a, b) => DateTime.parse(a.date!).compareTo(DateTime.parse(b.date!)));
      });
    });
  }

  String _currentSortOption = 'date_asc'; // Default sorting
  void _sortTasks(String criteria) {
    setState(() {
      _currentSortOption = criteria;
      switch (criteria) {
        case 'name_asc':
          _categoryList.sort((a, b) => a.name!.compareTo(b.name!));
          break;
        case 'name_desc':
          _categoryList.sort((a, b) => b.name!.compareTo(a.name!));
          break;
        case 'date_asc':
          _categoryList.sort((a, b) => DateTime.parse(a.date!).compareTo(DateTime.parse(b.date!)));
          break;
        case 'date_desc':
          _categoryList.sort((a, b) => DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));
          break;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        backgroundColor: Colors.blueAccent.shade200,
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 50, 0, 0),
                items: [
                  PopupMenuItem(
                    value: 'date_asc',
                    child: Row(
                      children: [
                        Text('Date (Ascending)'),
                        if (_currentSortOption == 'date_asc') Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'date_desc',
                    child: Row(
                      children: [
                        Text('Date (Descending)'),
                        if (_currentSortOption == 'date_desc') Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'name_asc',
                    child: Row(
                      children: [
                        Text('Name (A to Z)'),
                        if (_currentSortOption == 'name_asc') Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'name_desc',
                    child: Row(
                      children: [
                        Text('Name (Z to A)'),
                        if (_currentSortOption == 'name_desc') Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                ],
              ).then((value) {
                if (value != null) {
                  _sortTasks(value);
                }
              });
            },
          ),
        ],
      ),
      body:_categoryList.isEmpty ? Center(child: Text('No Tasks Available'),)
        : ListView.builder(itemBuilder: (context, index) {
        Color? cardColor;
        switch (_categoryList[index].priority) {
          case 'Low':
            cardColor = Colors.green.shade200;
            break;
          case 'Medium':
            cardColor = Colors.yellow.shade200;
            break;
          case 'High':
            cardColor = Colors.red.shade200;
            break;
        }
      return Padding(
        padding: EdgeInsets.only(top: 8.0,left: 10.0,right: 10.0),
        child: Card(
          elevation: 8.0,
          child: ListTile(
            tileColor: cardColor,
            title: Text(_categoryList[index].name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_categoryList[index].description.toString(),
                style: TextStyle(fontSize: 18),),
                Row(
                  children: [
                    if (_categoryList[index].time != null)
                      Text(_categoryList[index].time.toString()),
                    if (_categoryList[index].time != null)
                      SizedBox(width: 10),
                    if (_categoryList[index].date != null)
                      Text(_categoryList[index].date.toString()),
                  ],
                ),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  _showFormDialogue(context, task: _categoryList[index]);
                }
                else if (value == 'delete') {
                  _repository.deleteData('Tasks', _categoryList[index].id);
                  setState(() {
                    _categoryList.removeAt(index);
                  });
                  getAllTasks();
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit Task'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete Task'),
                  ),
                ];
              },
            ),
          ),
        ),
      );
    },
    itemCount: _categoryList.length,
    ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialogue(context);
        },
        backgroundColor: Colors.blueAccent.shade200,
        child: Icon(Icons.add),
      ),
    );
  }
}



