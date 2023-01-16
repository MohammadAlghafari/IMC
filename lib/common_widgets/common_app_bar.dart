//TODO: remove in future
// import 'package:flutter/material.dart';
// import 'package:imc/common_widgets/custom_text.dart';
// import 'package:imc/core/constant/app_color.dart';

// class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
//   const CommonAppBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         child: Container(
//           decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 8.0,
//                     offset: Offset(0, 5))
//               ],
//               color: AppColor.kPrimaryColor,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25))),
//           child: Padding(
//             padding: EdgeInsets.only(left: 10, right: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 40.0,
//                         height: 40.0,
//                         decoration: BoxDecoration(
//                             color: const Color(0xff7c94b6),
//                             image: DecorationImage(
//                                 image: AssetImage(
//                                     "assets/images/img_man.jpeg"),
//                                 fit: BoxFit.cover),
//                             borderRadius:
//                             BorderRadius.all(Radius.circular(50.0)),
//                             border: Border.all(
//                                 color: AppColor.kWhiteColor,
//                                 width: 2.0)),
//                       ),
//                       AppBoldText("January 11, 2022",
//                           color: AppColor.kWhiteColor, fontSize: 18),
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.search, color: Colors.white))
//                     ]),
//               ],
//             ),
//           ),
//         ),
//         preferredSize: Size(100,100)
//     );
//   }

//   @override
//   Size get preferredSize => Size(100,100);
// }

