class MyClass {
  final String classID;
  final String module;
  final String location;
  final String lecturerName;
  final String lecturerImage;
  final String startTime;
  final String endTime;
  final DateTime? date;
  MyClass({
    required this.classID,
    required this.module,
    required this.location,
    required this.lecturerImage,
    required this.lecturerName,
    required this.startTime,
    required this.endTime,
    this.date,
  });
}
