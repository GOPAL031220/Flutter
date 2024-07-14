import 'dart:io';

void main(List<String> args) {
  List<String> tasks = [];
  bool running = true;

  while (running) {
    print('\nTo-Do List Menu');  //menu print
    print('1. Add a task');
    print('2. Remove a task');
    print('3. View all tasks');
    print('4. Exit');

    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();  //user data input and stored

    if (choice == '1') {   //action as per choice
      stdout.write('Enter the task: ');
      String? task = stdin.readLineSync();
      if (task != null && task.isNotEmpty) {
        tasks.add(task);
        print('Task "$task" added to the list.');
      } else {
        print('Task cannot be empty.');
      }
    } else if (choice == '2') {
      stdout.write('Enter the task to remove: ');
      String? task = stdin.readLineSync();
      if (task != null && tasks.contains(task)) {
        tasks.remove(task);
        print('Task "$task" removed from the list.');
      } else {
        print('Task "$task" not found in the list.');
      }
    } else if (choice == '3') {
      if (tasks.isNotEmpty) {
        print('\nTo-Do List:');
        for (var i = 0; i < tasks.length; i++) {
          print('${i + 1}. ${tasks[i]}');
        }
      } else {
        print('No tasks in the list.');
      }
    } else if (choice == '4') {
      print('Exiting the program.');
      running = false;
    } else {
      print('Invalid option. Please try again.');
    }
  }
}