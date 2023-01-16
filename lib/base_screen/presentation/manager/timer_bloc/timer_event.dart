part of 'timer_bloc.dart';

abstract class TimerEvent {
  const TimerEvent();
}

class TimerStarted extends TimerEvent{
  final int duration;
  TimerStarted(this.duration);
}

class TimerPaused extends TimerEvent{
  TimerPaused();
}

class TimerResumed extends TimerEvent{
  TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerTicked extends TimerEvent {
  final int duration;
  const TimerTicked({required this.duration});
}

