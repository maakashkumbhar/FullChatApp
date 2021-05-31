import 'model/message.dart';

class Data {
  List<Model> listOfMessage = [
    Model(
        date: DateTime.now(),
        message: "THis is what we know",
        timeOfMessage: DateTime.now(),
        isme: true),
    Model(
        date: DateTime.now(),
        message: "We have to know what this is about",
        timeOfMessage: DateTime.now(),
        isme: false),
    Model(
        date: DateTime.now(),
        message: "We should enquire about this",
        timeOfMessage: DateTime.now(),
        isme: true),
    Model(
        date: DateTime.now(),
        message: "No we have to lay low right now",
        timeOfMessage: DateTime.now(),
        isme: false),
    Model(
        date: DateTime.now(),
        message: "You Murdered Someone What about that",
        timeOfMessage: DateTime.now(),
        isme: true),
    Model(
        date: DateTime.now(),
        message: "He Was an Oppressor",
        timeOfMessage: DateTime.now(),
        isme: false),
  ];
}
