import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_pdf_util.dart';
import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';
import 'dart:developer';
import 'package:pdf/pdf.dart' as PDF;
import 'package:pdf/widgets.dart' as pw;

class TeamLeaderPdfUtil {
  ///[generatePDFForQuestions] will generate pdf with all question and their details for the team leader
  static Future<File?> generatePDFForQuestions(List<TeamLeaderQuestionModel> listOfQuestionsAnswersValues) async {
    try {
      final document = pw.Document();

      document.addPage(pw.MultiPage(
          pageFormat: PDF.PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              _getPdfPageTitle(title: "Questions PDF"),
              pw.ListView.builder(
                itemCount: listOfQuestionsAnswersValues.length,
                itemBuilder: (context, index) {
                  return pw.Column(
                    children: [
                      pw.SizedBox(height: 30),
                      _getPdfTitleValuePairTextElement(
                        title: "Q${index + 1}. ${listOfQuestionsAnswersValues[index].questionAsked!}",
                        value: listOfQuestionsAnswersValues[index].questionAnswer,
                      ),
                      if (listOfQuestionsAnswersValues[index].questionAnswer == false) ...[
                        pw.SizedBox(height: 20),
                        _getPdfTitleValuePairTextElement(title: "Comments", description: listOfQuestionsAnswersValues[index].comment),
                        pw.SizedBox(height: 20),
                        pw.Text("Photos", textAlign: pw.TextAlign.center),
                        pw.Container(
                          width: 1.sw,
                          child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              if (listOfQuestionsAnswersValues[index].questionImage1 != null) ...[
                                _drawImage(
                                  title: "Image 1",
                                  filePath: "${listOfQuestionsAnswersValues[index].questionImage1}",
                                ),
                              ],
                              if (listOfQuestionsAnswersValues[index].questionImage2 != null) ...[
                                _drawImage(
                                  title: "Image 2",
                                  filePath: "${listOfQuestionsAnswersValues[index].questionImage2}",
                                ),
                              ],
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 20),
                      ],
                      pw.Divider(thickness: 2),
                    ],
                  );
                },
              ),
            ];
          }));
      List<int> bytes = await document.save();
      return await saveAndReturnFile(bytes, "Team_Leader_Question_Answers.pdf");
    } catch (e, stacktrace) {
      log("Error While generating PDF $e");
      log("GENERATING PDF ERROR ON LINE $stacktrace");
      throw "Error While generating PDF $e";
    }
  }

  /// The Function [ _getPdfPageTitle ] will generate title
  static pw.Widget _getPdfPageTitle({required String title}) {
    return pw.Center(child: pw.Text("$title", style: pw.TextStyle(fontSize: 18.sp)));
  }

  /// The Function [ _getPdfTitleValuePairTextElement ] will generate title - value pair
  static pw.Widget _getPdfTitleValuePairTextElement({required String title, bool? value, String? description}) {
    return pw.Row(
      children: [
        pw.Expanded(child: pw.Text("$title", style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.black))),
        pw.Container(width: 0.04.sw),
        pw.Expanded(
            child: pw.Text("${description ?? (value == true ? "Yes" : "No")}",
                textAlign: pw.TextAlign.right, style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.blue))),
      ],
    );
  }

  /// The Function [ _drawImage ] will generate title - value pair
  static pw.Widget _drawImage({
    String? title,
    required String filePath,
  }) {
    final image = pw.MemoryImage(
      File('$filePath').readAsBytesSync(),
    );

    return pw.Column(children: [
      if (title != null) pw.Text("$title"),
      if (title != null) pw.Container(height: 10),
      pw.Container(
        width: 100,
        height: 100,
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        child: pw.Image(image, fit: pw.BoxFit.cover),
      )
    ]);
  }
}