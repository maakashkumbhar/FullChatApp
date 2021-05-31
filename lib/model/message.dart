import 'package:flutter/foundation.dart';

class Model {
  String message;
  DateTime timeOfMessage;
  DateTime date;
  bool isme;

  Model(
      {@required this.date,
      @required this.isme,
      @required this.message,
      @required this.timeOfMessage});
}
