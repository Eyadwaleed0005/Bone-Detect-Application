import 'package:bonedetect/core/api/end_points.dart';
import 'package:bonedetect/core/dio_helper/dio_error_handler.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/data/model/login_request_model.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/data/model/success_login_message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bonedetect/core/dio_helper/dio_helper.dart';

class LoginRepository {
  Future<Either<String, SuccessLoginMessageModel>> login(
    LoginRequestModel body,
  ) async {
    try {
      final response = await DioHelper.postData(
        url: EndPoints.login,
        data: body.toJson(),
        isFormData: true,
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = SuccessLoginMessageModel.fromJson(data);
        return Right(result);
      }

      return Right(
        SuccessLoginMessageModel(message: data.toString(), token: '', name: ''),
      );
    } on DioException catch (e) {
      final errorMessage = DioExceptionHandler.handleDioError(e);
      return Left(errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
