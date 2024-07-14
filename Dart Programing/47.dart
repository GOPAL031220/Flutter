void main(List<String> args) {

  Set <int> numbers = {1, 2, 3, 4, 5};

  print("Initial set: $numbers");

  numbers.add(6);
  numbers.add(3); // Adding a duplicate element in set

  print("Set after adding elements: $numbers");

  numbers.remove(2);  //removing a Element

  print("Set after removing an element: $numbers");

}