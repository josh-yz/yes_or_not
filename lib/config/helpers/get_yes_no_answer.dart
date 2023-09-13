import 'package:dio/dio.dart';
import 'package:yes_or_not/domain/entities/message.dart';
import 'package:yes_or_not/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessegeEntity();
  }
}
