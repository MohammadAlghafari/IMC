part of 'timer_bloc.dart';

abstract class TimerState {
  final int duration;
  const TimerState(this.duration);
}

class TimerInitialState extends TimerState {
  const TimerInitialState(int duration) : super(duration);
}

// When Timer is active
class TimerRunInProgressState extends TimerState {
  const TimerRunInProgressState(int duration) : super(duration);

}

// When Timer is pause
class TimerRunPauseState extends TimerState {
  const TimerRunPauseState(int duration) : super(duration);

}

// When Timer is active
class TimerRunCompleteState extends TimerState {
  // 0 is passed in super constructor to show that the timer is completed
  const TimerRunCompleteState() : super(0);
}

