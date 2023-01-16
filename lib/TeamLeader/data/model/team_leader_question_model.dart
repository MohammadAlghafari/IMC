/*
///The question which will be asked to the team leader during the intervention will have the
///details like(question asked, answer, comment). [TeamLeaderQuestionModel] model will be used for it.
*/

/// questionAsked : ""
/// questionAnswer : false
/// questionImage1 : ""
/// questionImage2 : ""
/// comment : ""

class TeamLeaderQuestionModel {
  TeamLeaderQuestionModel({
    int? id,
      String? questionAsked, 
      bool? questionAnswer, 
      String? questionImage1, 
      String? questionImage2, 
      String? comment,}){
    _id = id;
    _questionAsked = questionAsked;
    _questionAnswer = questionAnswer;
    _questionImage1 = questionImage1;
    _questionImage2 = questionImage2;
    _comment = comment;
}

  TeamLeaderQuestionModel.fromJson(dynamic json) {
    _questionAsked = json['questionAsked'];
    _id = json['id'];
    _questionAnswer = json['questionAnswer'];
    _questionImage1 = json['questionImage1'];
    _questionImage2 = json['questionImage2'];
    _comment = json['comment'];
  }
  String? _questionAsked;
  bool? _questionAnswer;
  int? _id;
  String? _questionImage1;
  String? _questionImage2;
  String? _comment;
TeamLeaderQuestionModel copyWith({  String? questionAsked,
  bool? questionAnswer,
  int? id,
  String? questionImage1,
  String? questionImage2,
  String? comment,
}) => TeamLeaderQuestionModel(  questionAsked: questionAsked ?? _questionAsked,
  questionAnswer: questionAnswer ?? _questionAnswer,
  id: id ?? _id,
  questionImage1: questionImage1 ?? _questionImage1,
  questionImage2: questionImage2 ?? _questionImage2,
  comment: comment ?? _comment,
);
  String? get questionAsked => _questionAsked;
  bool? get questionAnswer => _questionAnswer;
  int? get id => _id;
  String? get questionImage1 => _questionImage1;
  String? get questionImage2 => _questionImage2;
  String? get comment => _comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['questionAsked'] = _questionAsked;
    map['questionAnswer'] = _questionAnswer;
    map['questionImage1'] = _questionImage1;
    map['questionImage2'] = _questionImage2;
    map['comment'] = _comment;
    return map;
  }

}