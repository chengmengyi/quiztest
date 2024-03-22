
class QuestionBean{
  String? question;
  String? a;
  String? b;
  String? answer;
  bool? answerResult;
  int? clickIndex;
  QuestionBean({this.question,this.a,this.b,this.answer});

  QuestionBean.fromJson(Map<String,dynamic> map) {
    question=map["question"];
    a=map["a"];
    b=map["b"];
    answer=map["answer"];
  }
}