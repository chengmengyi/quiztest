import 'package:get_storage/get_storage.dart';

class StorageName{
  static const lastAnswerIndex="lastAnswerIndex";
  static const heartNum="heartNum";
  static const coinNum="coinNum";
  static const answerScienceQuestion="answerScienceQuestion";
  static const getCoin100Question="getCoin100Question";
  static const answerRight30Question="answerRight30Question";
  static const todayMathCoinNum="todayMathCoinNum";
  static const todayAnswerRightNum="todayAnswerRightNum";
  static const cloakStr="cloakStr";
  static const userName="userName";
}

class StorageUtils{
  static final GetStorage _storageBox = GetStorage();

  static write(String key,dynamic value){
    _storageBox.write(key, value);
  }

  static T? read<T>(String key){
    try {
      return _storageBox.read(key) as T;
    } catch (e) {
      return null;
    }
  }
}