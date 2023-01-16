import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/widgets/normal_intervention_fab.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/widgets/rc_intervention_fab.dart';
import 'package:imc/common_widgets/common_chip_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/internal_pages/customer_details_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/internal_pages/customer_intervention_history_widget.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final bool isRC;
  final Records interventionRecord;
  CustomerDetailsScreen({required this.interventionRecord, required this.isRC});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  PageController pageController = PageController(initialPage: 0);

  int _index = 0;

  @override
  void initState() {
    super.initState();
    //if flow is RC intervention,then initialise the RC intervention
    if (widget.isRC) {
      _initRCInterventionDetails();
    } else {
      //if flow is normal intervention
      _initInterventionDetails();
    }
  }

  ///[_initInterventionDetails] Function to get the intervention details(if available) from local database
  void _initInterventionDetails() async {
    final _bloc = BlocProvider.of<InterventionDetailsCubit>(context);

    // creating a new instance of InterventionDetailsModel with these vaues because
    // we want to show atlease one widget for these lists
    InterventionDetailsModel _interventionDetails =
    InterventionDetailsModel().copyWith(photoOfIndexImage: [""], enterAdditionallyMaterial: [""], photosOfNewMeterInstalled: [""]);
    _bloc.changePageState(InterventionDetailsLoaded(_interventionDetails));

    // getting local database instance from get it.
    final _interventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();
    InterventionDetailsTableData? _interventionDetailsById =
    await _interventionDetailsDatabase.getInterventionDetailsByIdFromDb(widget.interventionRecord.id!);
    print("=====hunny000====$_interventionDetailsById");

    if (_interventionDetailsById != null) {
      //* converting string of data into List<String> and saving it into a variable
      List<String>? photoOfIndexImage;
      print("=====hunny====$_interventionDetailsById");

      if (_interventionDetailsById.photoOfIndexImage != null && _interventionDetailsById.photoOfIndexImage!.isNotEmpty) {
        List<dynamic>? decodedPhotoOfIndexImage = jsonDecode(_interventionDetailsById.photoOfIndexImage!);
        photoOfIndexImage = List<String>.from(decodedPhotoOfIndexImage ?? ['']);
      }
      else{
        photoOfIndexImage = [""];
      }

      List<String>? enterAdditionallyMaterial;
      if (_interventionDetailsById.enterAdditionallyMaterial != null && _interventionDetailsById.enterAdditionallyMaterial!.isNotEmpty) {
        List<dynamic>? decodedEnterAdditionallyMaterial = jsonDecode(_interventionDetailsById.enterAdditionallyMaterial!);
        enterAdditionallyMaterial = List<String>.from(decodedEnterAdditionallyMaterial ?? ['']);
      }
      else{
        enterAdditionallyMaterial = [""];
      }

      List<String>? photosOfNewMeterInstalled;
      if (_interventionDetailsById.photosOfNewMeterInstalled != null) {
        List<dynamic>? decodedPhotosOfNewMeterInstalled = jsonDecode(_interventionDetailsById.photosOfNewMeterInstalled!);
        photosOfNewMeterInstalled = List<String>.from(decodedPhotosOfNewMeterInstalled ?? ['']);

      }
      else{
        photosOfNewMeterInstalled = [""];

      }

      //* converting the intervention details model into json
      var interventionJsonObject = _interventionDetailsById.toJson();


      //* replacing the value of key from the json
      interventionJsonObject['photoOfIndexImage'] = photoOfIndexImage;
      interventionJsonObject['enterAdditionallyMaterial'] = enterAdditionallyMaterial;
      interventionJsonObject['photosOfNewMeterInstalled'] = photosOfNewMeterInstalled;


      //* converting the json we occupied from prev line into the TableData model
      _interventionDetails = InterventionDetailsModel.fromJson(interventionJsonObject);
    }
    // changing bloc page state
    _bloc.changePageState(InterventionDetailsLoaded(_interventionDetails));
  }

  ///[_initRCInterventionDetails] to initialize 'RC intervention details' with values from local db(if exists)
  void _initRCInterventionDetails() async {
    final _bloc = BlocProvider.of<RCInterventionDetailsCubit>(context);

    // Creating a new instance of RC InterventionDetailsModel
    RCInterventionDetailsModel _rcInterventionDetails = RCInterventionDetailsModel();

    //this is added to display one container;
    RCInterventionDetailsModel newDetails = _rcInterventionDetails.copyWith(photosOfAction: [""]);
    _bloc.changePageState(RCInterventionDetailsLoaded(newDetails));

    final _rcInterventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();
    //* Function to get  the rc intervention details(if exists) from local database
    RCInterventionDetailsTableData? _rcInterventionDetailsById =
    await _rcInterventionDetailsDatabase.getRCInterventionDetailsByIdFromDb(widget.interventionRecord.id!);

    if (_rcInterventionDetailsById != null) {
      //* converting string of data into List<String> and saving it into a variable
      List<String>? photosOfAction;
      if (_rcInterventionDetailsById.photosOfAction != null && _rcInterventionDetailsById.photosOfAction!.isNotEmpty) {
        List<dynamic>? decodedPhotosOfAction = jsonDecode(_rcInterventionDetailsById.photosOfAction!);
        photosOfAction = List<String>.from(decodedPhotosOfAction ?? ['']);
      }

      //* converting the intervention details model into json
      var rcInterventionJsonObject = _rcInterventionDetailsById.toJson();

      //* replacing the value of key from the json
      rcInterventionJsonObject['photosOfAction'] = photosOfAction;

      //* converting the json we occupied from prev line into the TableData model
      _rcInterventionDetails = RCInterventionDetailsModel.fromJson(rcInterventionJsonObject);

      _bloc.changePageState(RCInterventionDetailsLoaded(_rcInterventionDetails));
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);
    return Scaffold(
      /*if the intervention is not completed then show 'start' button, if not then show nothing(null)
      if intervention is not completed, and is of type 'RC' then show 'RcInterventionFloatingActionButton' and if it
      is normal intervention then show 'NormalInterventionFloatingActionButton'
      */
      floatingActionButton:
      (widget.interventionRecord.interventionStatusId == null ||
          widget.interventionRecord.interventionStatusId != InterventionStatus.InterventionStatusRealisee.interventionStatusCode ||
          DateTime.parse(widget.interventionRecord.scheduleStart!).isAfter(DateTime.now()))
          ?
      (widget.isRC
          ? RcInterventionFloatingActionButton(
        interventionRecord: widget.interventionRecord,
      )
          : NormalInterventionFloatingActionButton(
        interventionRecord: widget.interventionRecord,
      ))
          : null,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 0.2.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                    color: AppColor.kPrimaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r))),
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.02.sw),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      BackButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      AppBoldText("${widget.interventionRecord.client?.firstname} ${widget.interventionRecord.client?.lastname}", color: AppColor.kWhiteColor, fontSize: 18),
                      // this button is added to center align the text, it has no use
                      IconButton(onPressed: (){}, icon: Icon(Icons.add, color: AppColor.kPrimaryColor,)),
                    ]),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
            child: Transform.translate(
              offset: Offset(0.02.sw, -0.02.sh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.28.sw,
                    child: ChipWidget(
                        pageControllerVal: pageController,
                        animateToPage: 0,
                        containerColor: _index == 0 ? Color(0xff363535) : Colors.white,
                        textColor: _index == 0 ? AppColor.kWhiteColor : Color(0xff7F7F7F),
                        text: appLocalizatons.translate("details")),
                  ),
                  SizedBox(width: 6.w),
                  SizedBox(
                    width: 0.28.sw,
                    child: ChipWidget(
                        pageControllerVal: pageController,
                        animateToPage: 1,
                        containerColor: _index == 1 ? Color(0xff363535) : Colors.white,
                        textColor: _index == 1 ? AppColor.kWhiteColor : Color(0xff7F7F7F),
                        text: appLocalizatons.translate("history")),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                controller: pageController,
                children: [
                  CustomerDetailsWidget(
                    interventionRecord: widget.interventionRecord,
                  ),
                  CustomerInterventionHistoryWidget(
                    interventionRecord: widget.interventionRecord,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}