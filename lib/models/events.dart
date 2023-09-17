class Events {
  String eventID;
  String title;
  String? about;
  String? location;
  DateTime timeStart;
  DateTime? timeEnd;
  String imageUrl;
  Events({
    required this.eventID,
    required this.title,
    this.about,
    this.location,
    this.timeEnd,
    required this.timeStart,
    required this.imageUrl,
  });
}
