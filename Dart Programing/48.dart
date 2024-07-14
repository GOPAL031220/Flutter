void main(List<String> args) {
 
  Map<String, int> pupilMarks = {
    'Ava': 90,
    'Brandon': 85,
    'Cameron': 88,
  };

  print("Initial pupil marks: $pupilMarks");

  pupilMarks['Dylan'] = 92;
  pupilMarks['Emily'] = 95;

  print("Pupil marks after adding new entries: $pupilMarks");

  pupilMarks['Ava'] = 93;

  print("Pupil marks after updating Ava's mark: $pupilMarks");

  pupilMarks.remove('Brandon');

  print("Pupil marks after removing Brandon: $pupilMarks");

  bool containsCameron = pupilMarks.containsKey('Cameron');
  print("Does the pupil marks contain Cameron? $containsCameron");

  bool containsMark92 = pupilMarks.containsValue(92);
  print("Does the pupil marks contain the mark 92? $containsMark92");

  print("Iterating over the pupil marks:");
  pupilMarks.forEach((name, mark) {
    print("$name: $mark");
  });
}