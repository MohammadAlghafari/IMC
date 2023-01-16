import 'package:flutter/foundation.dart';
/*
 /// The [Event] Model is used to add event in the planning week module
 /// In Planning week for the Package we are using we need to define a particular model
 /// in which the data will be displayed that's why we are using the event model
 */

@immutable
class Event {
  final String title;
  final int interventionId;

  const Event( {required this.interventionId, this.title = "Title"});

  @override
  bool operator ==(Object other) => other is Event
      && title == other.title
      && interventionId == other.interventionId;

  @override
  int get hashCode => super.hashCode;

}
