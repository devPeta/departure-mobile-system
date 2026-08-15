import 'package:flutter/material.dart';

class DepartureLogModel {
  final String childName;
  final String guardian;
  final String time;
  final String date;
  final String status;
  final String image;
  final bool isVerified;

  DepartureLogModel({
    required this.childName,
    required this.guardian,
    required this.time,
    required this.date,
    required this.status,
    required this.image,
    required this.isVerified,
  });

  DepartureLogModel copyWith({
    String? status,
    bool? isVerified,
  }) {
    return DepartureLogModel(
      childName: childName,
      guardian: guardian,
      time: time,
      date: date,
      status: status ?? this.status,
      image: image,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}