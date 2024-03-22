import 'dart:async';

import 'package:get/get.dart';
import 'package:quiznow/bean/question_bean.dart';
import 'package:quiznow/dialog/answer_fail/answer_fail_dialog.dart';
import 'package:quiznow/dialog/answer_right/answer_right_dialog.dart';
import 'package:quiznow/dialog/comlete_task/complete_task_dialog.dart';
import 'package:quiznow/dialog/no_answer_count/no_answer_count_dialog.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/question_util.dart';
import 'package:quiznow/util/task_utils.dart';
import 'package:quiznow/util/user_info_utils.dart';

class AnswerController extends GetxController{
  //0history 1nature 2math 3science 4animal
  var categoryType=0,questionIndex=0,questionSize=0,canClickAnswer=true;
  QuestionBean? currentQuestion;

  @override
  void onInit() {
    super.onInit();
    categoryType=Routers.getParams()["index"];
    questionIndex=QuestionUtil.instance.getQuestionIndexByType(categoryType);
    questionSize=QuestionUtil.instance.getQuestionListSizeByType(categoryType);
    currentQuestion=QuestionUtil.instance.getQuestionByTypeIndex(categoryType, questionIndex);
  }

  clickAnswer(index){
    if(!canClickAnswer){
      return;
    }
    if(UserInfoUtil.instance.heartNum<=0){
      Routers.showDialog(child: NoAnswerCountDialog());
      return;
    }
    canClickAnswer=false;
    var result = _checkAnswerResult(index);
    currentQuestion?.answerResult=result;
    currentQuestion?.clickIndex=index;
    update(["answer"]);
    var taskCompleteState = TaskUtils.instance.updateAnswerState(categoryType, result,questionIndex+1>=questionSize);
    if(taskCompleteState!=3){
      if(!result){
        UserInfoUtil.instance.reduceHeartNum();
      }else{
        UserInfoUtil.instance.updateCoinNum(10);
      }
      Routers.showDialog(
          child: CompleteTaskDialog(
            getReward: (){
              UserInfoUtil.instance.updateCoinNum(50);
              TaskUtils.instance.updateCompleteState(taskCompleteState);
              _updateNextQuestion();
            },
            continueCall: (){
              _updateNextQuestion();
            },
          )
      );
      return;
    }
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      timer.cancel();
      if(!result){
        UserInfoUtil.instance.reduceHeartNum();
        Routers.showDialog(
          child: AnswerFailDialog(
            call: (next){
              if(next){
                _updateNextQuestion();
              }else{
                _answerAgain();
              }
            },
          )
        );
      }else{
        Routers.showDialog(
            child: AnswerRightDialog(
              call: (){
                _updateNextQuestion();
              },
            )
        );
      }
    });
  }

  _answerAgain(){
    currentQuestion?.clickIndex=null;
    currentQuestion?.answerResult=null;
    update(["answer"]);
    canClickAnswer=true;
  }

  _updateNextQuestion(){
    questionIndex++;
    if(questionIndex>=questionSize){
      questionIndex=0;
      QuestionUtil.instance.clearQuestionInfo(categoryType);
    }
    QuestionUtil.instance.updateQuestionIndexByType(categoryType, questionIndex);
    currentQuestion=QuestionUtil.instance.getQuestionByTypeIndex(categoryType, questionIndex);
    update(["answer"]);
    canClickAnswer=true;
  }

  bool _checkAnswerResult(index){
    if(index==0){
      return currentQuestion?.answer=="a";
    }
    return currentQuestion?.answer=="b";
  }

  getTitleByType(){
    switch(categoryType){
      case 0:return "History";
      case 1:return "Nature";
      case 2:return "Math";
      case 3:return "Science";
      default:return "Animal";
    }
  }
}