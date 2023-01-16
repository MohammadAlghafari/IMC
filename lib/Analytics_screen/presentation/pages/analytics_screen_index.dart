import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/Analytics_screen/presentation/cubit/analytics_week_cubit/analytics_week_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Analytics_screen/presentation/cubit/analytics_time_cubit/analytics_time_cubit.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/common_widgets/common_drawer.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/date_time_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../core/constant/app_color.dart';

class AnalyticScreenIndex extends StatefulWidget {
  const AnalyticScreenIndex({Key? key}) : super(key: key);

  @override
  State<AnalyticScreenIndex> createState() => _AnalyticScreenIndexState();
}

class _AnalyticScreenIndexState extends State<AnalyticScreenIndex> {
  //Chart that displays week wise analytics data with values (week name, total status for that week)
  List<StackedChartDataModel> stackedChartData = [];
  //Chart that displays week wise analytics timedata with values (intervention status, total for that status)
  List<TimeChartDataModel> timeChartData = [];

  ///[getInterventionStatusType] will return the translated Intervention Status Name
  List getInterventionStatusType(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return [
      appLocalizations.translate("success"),
      appLocalizations.translate("half_kO"),
      "KO",
    ];
  }

  //storing the 3 colors for intervention type (success, ko, semi-ko)
  List color = [AppColor.kSuccessColor, AppColor.kToDOColor, AppColor.kCaseColor];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // This is the selected month for the analytics
  late DateTime _selectedDate;
  DateTime _now = DateTime.now();

  //var to store the month subtracted from  current month (will needed in caching of analytics data)
  late final int _prev7thMonthFromNow;
  late final AnalyticsWeekCubit _analyticsWeekCubit;
  late final AnalyticsTimeCubit _analyticsTimeCubit;
  late final String _selectedMonth;
  late final String _selectedYear;

  @override
  void initState() {
    super.initState();

    // setting selected month,year,day
    _selectedDate = _now;
    _selectedMonth = _selectedDate.month.toString().padLeft(2, "0");
    _selectedYear = _selectedDate.year.toString();

    //setting the prev 7th month from now
    _prev7thMonthFromNow = _now.subtract(Duration(days: 210)).month;

    //initializing the Bloc
    initDataFromBloc();
  }

  ///[initDataFromBloc] will initlize the(analytics time, week) data according to the passed month value
  void initDataFromBloc() {
    //accessing the 'analytics week' bloc
    _analyticsWeekCubit = BlocProvider.of<AnalyticsWeekCubit>(context);
    //getting analytics week data for current month year
    _analyticsWeekCubit.getAnalyticsWeekData(fetchFromApi: true, monthVal: _selectedMonth, yearVal: _selectedYear);

    //accessing the 'analytics time' bloc
    _analyticsTimeCubit = BlocProvider.of<AnalyticsTimeCubit>(context);
    //getting analytics time data for the current month year
    _analyticsTimeCubit.getAnalyticsTimeData(fetchFromApi: true, monthVal: _selectedMonth, yearVal: _selectedYear);
  }

  ///[getAnalyticsDataFromApi] will fetch the analytics data from the api for the passed (month, year)
  void getAnalyticsDataFromApi(int selectedMonth, int selectedYear) {
    //getting anayltics week data
    _analyticsWeekCubit.getAnalyticsWeekData(
        fetchFromApi: true, monthVal: "${selectedMonth.toString().padLeft(2, "0")}", yearVal: selectedYear.toString());

    //getting analytics time data
    _analyticsTimeCubit.getAnalyticsTimeData(
        fetchFromApi: true, monthVal: "${_selectedDate.month.toString().padLeft(2, "0")}", yearVal: _selectedDate.year.toString());
  }

  ///[getAnalyticsDataFromCache] will fetch the analytics data from the local DB for the passed (month, year)
  void getAnalyticsDataFromCache(int selectedMonth, int selectedYear) {
    //getting anayltics week data
    _analyticsWeekCubit.getAnalyticsWeekData(
        fetchFromApi: false, monthVal: "${selectedMonth.toString().padLeft(2, "0")}", yearVal: selectedYear.toString());

    //getting analytics time data
    _analyticsTimeCubit.getAnalyticsTimeData(
        fetchFromApi: false, monthVal: "${selectedMonth.toString().padLeft(2, "0")}", yearVal: selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: CommonDrawer(userRoleId: AuthHiveHelper.getUserRoleId),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 0.16.sh,
          padding: EdgeInsets.only(bottom: 0.05.sh),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
              color: AppColor.kPrimaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  GestureDetector(
                    onTap: () => scaffoldKey.currentState?.openDrawer(),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image:  NetworkImage('${AuthHiveHelper.getUserPicture}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(color: AppColor.kWhiteColor, width: 2.0),
                      ),
                    ),
                  ),
                  AppBoldText(appLocalizations.translate("summary_of_the_month"), color: AppColor.kWhiteColor, fontSize: 16),
                  Text("") // added for the extra space
                ]),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.02.sh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedDate = DateTimeUtils.subtractMonth(_selectedDate);
                            //if the _selectedDate is user's current date or if the _selectedDate's month is the 6th previous month
                            // or _selectedDate's month is less than the prev 6th month
                            //of the user's current date, then the analytics data will be fetched from the api
                            if ((_selectedDate.month == _now.month && _selectedDate.year == _now.year) ||
                                (_selectedDate.month == _prev7thMonthFromNow && _selectedDate.year == _now.year) ||
                                (_selectedDate.isBefore(_now.subtract(Duration(days: 210))))) {
                              getAnalyticsDataFromApi(_selectedDate.month, _selectedDate.year);
                            } else {
                              //fetching the analytics cached data
                              getAnalyticsDataFromCache(_selectedDate.month, _selectedDate.year);
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios, color: AppColor.kPrimaryColor, size: 20)),
                    AppBoldText("${AppConstant.getListOfMonths(context)[_selectedDate.month - 1]}, ${_selectedDate.year}",
                        color: AppColor.kPrimaryColor, fontSize: 16),
                    IconButton(
                        onPressed: () {
                          if ((_selectedDate.month < _now.month && _selectedDate.year == _now.year) || _selectedDate.year < _now.year) {
                            setState(() {
                              _selectedDate = DateTimeUtils.addMonth(_selectedDate);
                              //if the _selectedDate is user's current date or if the _selectedDate's month is the 6th previous month
                              // or _selectedDate's month is less than the prev 6th month
                              //of the user's current date, then the analytics data will be fetched from the api
                              if ((_selectedDate.month == _now.month && _selectedDate.year == _now.year) ||
                                  (_selectedDate.month == _prev7thMonthFromNow && _selectedDate.year == _now.year) ||
                                  (_selectedDate.year != _now.year)) {
                                getAnalyticsDataFromApi(_selectedDate.month, _selectedDate.year);
                              } else {
                                //fetching the analytics cached data
                                getAnalyticsDataFromCache(_selectedDate.month, _selectedDate.year);
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(appLocalizations.translate("you_cannot_view_analytics_of_the_next_month"))));
                          }
                        },
                        icon: Icon(Icons.arrow_forward_ios, color: AppColor.kPrimaryColor, size: 20))
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppBoldText(appLocalizations.translate("interventions_carried_out"), fontSize: 12)),
                SizedBox(height: 10),
                BlocConsumer<AnalyticsWeekCubit, AnalyticsWeekState>(
                  listener: (context, state) {
                    if (state is AnalyticsWeekDataLoaded) {
                      AnalyticsWeekTableData _analyticsWeekData = state.weekTableData;

                      stackedChartData = [];
                      stackedChartData.addAll([
                        StackedChartDataModel(
                          appLocalizations.translate("week") + " 1",
                          _analyticsWeekData.week1TotalForStatus2 ?? 0,
                          _analyticsWeekData.week1TotalForStatus3 ?? 0,
                          _analyticsWeekData.week1TotalForStatus4 ?? 0,
                        ),
                        StackedChartDataModel(
                          appLocalizations.translate("week") + " 2",
                          _analyticsWeekData.week2TotalForStatus2 ?? 0,
                          _analyticsWeekData.week2TotalForStatus3 ?? 0,
                          _analyticsWeekData.week2TotalForStatus4 ?? 0,
                        ),
                        StackedChartDataModel(
                          appLocalizations.translate("week") + " 3",
                          _analyticsWeekData.week3TotalForStatus2 ?? 0,
                          _analyticsWeekData.week3TotalForStatus3 ?? 0,
                          _analyticsWeekData.week3TotalForStatus4 ?? 0,
                        ),
                        StackedChartDataModel(
                          appLocalizations.translate("week") + " 4",
                          _analyticsWeekData.week4TotalForStatus2 ?? 0,
                          _analyticsWeekData.week4TotalForStatus3 ?? 0,
                          _analyticsWeekData.week4TotalForStatus4 ?? 0,
                        )
                      ]);
                    }
                  },
                  builder: (context, state) {
                    if (state is AnalyticsWeekDataLoaded) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            SfCartesianChart(
                                primaryXAxis: CategoryAxis(
                                  axisLine: AxisLine(width: 0),
                                  majorGridLines: MajorGridLines(width: 0),
                                ),
                                series: <ChartSeries>[
                                  StackedColumnSeries<StackedChartDataModel, String>(
                                      color: AppColor.kCaseColor, // InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusColor,
                                      dataSource: stackedChartData,
                                      xValueMapper: (StackedChartDataModel data, _) => data.WeekName,
                                      yValueMapper: (StackedChartDataModel data, _) => data.valueForStatus2),
                                  StackedColumnSeries<StackedChartDataModel, String>(
                                      color: AppColor.kToDOColor, //InterventionStatus.InterventionStatusStandBy.interventionStatusColor,
                                      dataSource: stackedChartData,
                                      xValueMapper: (StackedChartDataModel data, _) => data.WeekName,
                                      yValueMapper: (StackedChartDataModel data, _) => data.valueForStatus3),
                                  StackedColumnSeries<StackedChartDataModel, String>(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                      color: AppColor.kSuccessColor,
                                      dataSource: stackedChartData,
                                      xValueMapper: (StackedChartDataModel data, _) => data.WeekName,
                                      yValueMapper: (StackedChartDataModel data, _) => data.valueForStatus4),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      3,
                                          (index) => Container(
                                        height: 50,
                                        width: 90,
                                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(color: color[index], borderRadius: BorderRadius.circular(15))),
                                          SizedBox(width: 8),
                                          AppRegularText(getInterventionStatusType(context)[index]),
                                        ]),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (state is AnalyticsWeekDataError) {
                      return SizedBox(
                        height: 0.3.sh,
                        child: Center(child: AppRegularText("${appLocalizations.translate("an_error_occured")}")),);
                    } else {
                      return Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            height: 280,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(child: AppBoldText(appLocalizations.translate("work_time"), fontSize: 12)),
                ),
                BlocConsumer<AnalyticsTimeCubit, AnalyticsTimeState>(
                  listener: (context, state) {
                    if (state is AnalyticsTimeDataLoaded) {
                      AnalyticsTimeTableData _analyticsTimeData = state.timeTableData;

                      print("MOM ===$_analyticsTimeData");
                      timeChartData = [];
                      timeChartData.addAll([
                        TimeChartDataModel(
                          "${InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusName}",
                          _analyticsTimeData.hoursForStatus2?.toDouble() ?? 0,
                            InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusColor
                        ),
                        TimeChartDataModel(
                          "${InterventionStatus.InterventionStatusStandBy.interventionStatusName}",
                          _analyticsTimeData.hoursForStatus3?.toDouble() ?? 0,
                            InterventionStatus.InterventionStatusStandBy.interventionStatusColor

                        ),
                        TimeChartDataModel(
                          "${InterventionStatus.InterventionStatusRealisee.interventionStatusName}",
                          _analyticsTimeData.hoursForStatus4?.toDouble() ?? 0,
                            InterventionStatus.InterventionStatusRealisee.interventionStatusColor

                        ),
                      ]);

                      timeChartData.toList().forEach((element) {
                        print("JAY===${element.interventionStatus} ${element.interventionHours}");
                      });


                    }
                  },
                  builder: (context, state) {
                    if (state is AnalyticsTimeDataLoaded) {
                      return SfCircularChart(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        // backgroundColor: Colors.amber,
                        series: <CircularSeries>[
                          DoughnutSeries<TimeChartDataModel, String>(
                              dataLabelSettings: DataLabelSettings(isVisible: true, overflowMode: OverflowMode.shift, labelPosition: ChartDataLabelPosition.outside, color: AppColor.kPrimaryColor),
                              dataSource: timeChartData,
                              xValueMapper: (TimeChartDataModel data, _) => data.interventionStatus,
                              yValueMapper: (TimeChartDataModel data, _) => data.interventionHours,
                              // pointShaderMapper: (dynamic data, int index, Color color, Rect rect){
                              //   return data;
                              // },
                              // pointShaderMapper: data,
                              pointColorMapper: (TimeChartDataModel data,_) => data.color,
                              startAngle: 270, // Starting angle of doughnut
                              endAngle: 90 // Ending angle of doughnut
                          )
                        ],
                      );
                    } else if (state is AnalyticsTimeDataError) {
                      return SizedBox(
                        height: 0.4.sh,
                        child: Center(
                          child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
                        ),
                      );
                    } else {
                      return Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            height: 150,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

// This is the data model for week chart
class StackedChartDataModel {
  StackedChartDataModel(this.WeekName, this.valueForStatus2, this.valueForStatus3, this.valueForStatus4);
  final String WeekName;
  final int valueForStatus2;
  final int valueForStatus3;
  final int valueForStatus4;
}

// This is the data model for time chart
class TimeChartDataModel {
  TimeChartDataModel(this.interventionStatus, this.interventionHours, this.color);
  final String interventionStatus;
  final double? interventionHours;
  final Color color;
}