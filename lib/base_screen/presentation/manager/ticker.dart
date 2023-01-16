
class Ticker{
  const Ticker();

  //The ticker will be our data source for the timer application.
  // It will expose a stream of ticks which we can subscribe and react to.
  Stream<int> tick({required int totalDurationInSeconds}){
    return Stream.periodic(Duration(seconds: 1), (count) => totalDurationInSeconds - count - 1).take(totalDurationInSeconds);
  }
}