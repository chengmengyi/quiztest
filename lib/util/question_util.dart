import 'dart:convert';

import 'package:quiznow/bean/question_bean.dart';
import 'package:quiznow/util/ext.dart';
import 'package:quiznow/util/storage_utils.dart';

class QuestionUtil{
  factory QuestionUtil() => _getInstance();

  static QuestionUtil get instance => _getInstance();

  static QuestionUtil? _instance;

  static QuestionUtil _getInstance() {
    _instance ??= QuestionUtil._internal();
    return _instance!;
  }

  QuestionUtil._internal();

  final Map<int,List<QuestionBean>> _questionMap={};

  initQuestionList(){
    _questionMap[0]=_initQuestionListByType(historyStr);
    _questionMap[1]=_initQuestionListByType(natureStr);
    _questionMap[2]=_initQuestionListByType(mathStr);
    _questionMap[3]=_initQuestionListByType(scienceStr);
    _questionMap[4]=_initQuestionListByType(animalStr);
  }

  int getQuestionIndexByType(type)=> StorageUtils.read<int>("${StorageName.lastAnswerIndex}_$type")??0;

  updateQuestionIndexByType(type,index){
    StorageUtils.write("${StorageName.lastAnswerIndex}_$type", index);
  }

  int getQuestionListSizeByType(type)=>_questionMap[type]?.length??0;

  QuestionBean? getQuestionByTypeIndex(type,index){
    try{
      return _questionMap[type]?[index];
    }catch(e){
      return null;
    }
  }

  clearQuestionInfo(type){
    _questionMap[type]?.forEach((element) {
      element.answerResult=null;
      element.clickIndex=null;
    });
  }

  List<QuestionBean> _initQuestionListByType(String str){
    List<QuestionBean> list=[];
    try{
      var json = jsonDecode(String.fromCharCodes(base64Decode(str)));
      for (var element in (json as List)) {
        list.add(QuestionBean.fromJson(element));
      }
      return list;
    }catch(e){
      return [];
    }
  }
}