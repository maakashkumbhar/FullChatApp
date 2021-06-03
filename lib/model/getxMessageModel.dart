

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String message;
  DateTime timeOfMessage;
  DateTime date;
  bool isme;
  String user;

  MessageModel(
      {this.message, this.date, this.isme, this.timeOfMessage, this.user});

  MessageModel.fromJson(Map<String, dynamic> json) {
    this.message = json['Message'];
    this.date = json['Timestamp'];
    this.isme = json['isme'];
    this.user = json['user'];
  
  }

  MessageModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    message = documentSnapshot['Message'];
    timeOfMessage = documentSnapshot['Timestamp'];
    isme = documentSnapshot['isme'];
    user = documentSnapshot['user'];
  }
}
