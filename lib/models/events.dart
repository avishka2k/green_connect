class Events {
  String eventID;
  String title;
  String about;
  String location;
  DateTime timeStart;
  DateTime timeEnd;
  String imageUrl;
  Events({
    required this.eventID,
    required this.title,
    required this.about,
    required this.location,
    required this.timeEnd,
    required this.timeStart,
    required this.imageUrl,
  });
}