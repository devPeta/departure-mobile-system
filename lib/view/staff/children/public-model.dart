enum PupilStatus {
  present,
  departed,
  pendingPickup,
}

class PupilModel {
  final String name;
  final String age;
  final String room;
  final String image;
  final PupilStatus status;

  PupilModel({
    required this.name,
    required this.age,
    required this.room,
    required this.image,
    required this.status,
  });
}