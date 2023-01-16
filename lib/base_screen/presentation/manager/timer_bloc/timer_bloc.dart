import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:imc/base_screen/data/local_storage/local_database.dart';
import 'package:imc/base_screen/presentation/manager/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {

  // setting the timer duration in seconds
  static const int _duration = 1 * 60 * 60;

  // creating a variable for Ticker class
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker}) : this._ticker = ticker,  super(TimerInitialState(_duration)) {

    on<TimerStarted>(_onTimerStarted);
    on<TimerTicked>(_onTicked);
    on<TimerPaused>(_onTimerPaused);
    on<TimerResumed>(_onTimerResumed);
    on<TimerReset>(_onTimerReset);

  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }


  void  _onTimerStarted(TimerStarted event, Emitter<TimerState> emit){
    UserHiveHelper.setIsTimerActive(true);
    emit(TimerRunInProgressState(event.duration));
    // cancelling any old subscription
    _tickerSubscription?.cancel();
    // creating a new ticker subscription
    _tickerSubscription = _ticker.tick(totalDurationInSeconds: event.duration).listen((timeRemaining) {
      return add(TimerTicked(duration: timeRemaining));
    });
  }


  ///Every time a TimerTicked event is received, if the tick’s duration is greater than 0,
  /// we need to push an updated TimerRunInProgress state with the new duration.
  ///Otherwise, if the tick’s duration is 0,
  ///our timer has ended and we need to push a TimerRunComplete state.
  void  _onTicked(TimerTicked event, Emitter<TimerState> emit){
    UserHiveHelper.saveBreakTimePassed(event.duration);
    emit(event.duration > 0 ? TimerRunInProgressState(event.duration) : TimerRunCompleteState());
  }

  void _onTimerPaused(TimerPaused event, Emitter<TimerState> emit){
    if (state is TimerRunInProgressState) {
      _tickerSubscription?.pause();
      emit(TimerRunPauseState(state.duration));
    }
  }

  void _onTimerResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPauseState) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgressState(state.duration));
    }
  }

  void _onTimerReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitialState(_duration));
  }

}
