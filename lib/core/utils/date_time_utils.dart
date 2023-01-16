import 'package:drift/drift.dart';

class DateTimeUtils{

  // Takes a dateTime and subtract month from that date
  static DateTime subtractMonth(DateTime oldDateTime){
    int newMonth;
    int newYear;
    if(oldDateTime.month == 1){
      // because if month is january then reset the month to 12 (december)
      newMonth = 12;
      // because we want to change month
      newYear = oldDateTime.year - 1;
    }
    else{
      newMonth = oldDateTime.month - 1;
      newYear = oldDateTime.year;
    }
    return DateTime(newYear, newMonth);
  }

  // Takes a dateTime and add month from that date
  static DateTime addMonth(DateTime oldDateTime){
    int newMonth;
    int newYear;
    if(oldDateTime.month == 12){
      // because if month is december then reset the month to 1 (january)
      newMonth = 1;
      // because we want to change month
      newYear = oldDateTime.year + 1;
    }
    else{
      newMonth = oldDateTime.month + 1;
      newYear = oldDateTime.year;
    }
    return DateTime(newYear, newMonth);
  }


}