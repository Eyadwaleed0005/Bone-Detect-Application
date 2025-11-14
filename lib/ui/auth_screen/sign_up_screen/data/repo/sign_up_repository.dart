import 'package:bonedetect/core/api/end_points.dart';
import 'package:bonedetect/core/dio_helper/dio_error_handler.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/data/model/sign_up_request_model.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/data/model/success_register_message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bonedetect/core/dio_helper/dio_helper.dart';

class SignUpRepository {
  Future<Either<String, SuccessRegisterMessageModel>> signUp(
    SignUpRequestModel body,
  ) async {
    try {
      final response = await DioHelper.postData(
        url: EndPoints.register,
        data: body.toJson(),
        isFormData: true,
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = SuccessRegisterMessageModel.fromJson(data);
        return Right(result);
      }

      return Right(
        SuccessRegisterMessageModel(
          message: data.toString(),
          token: '',
        ),
      );
    } on DioException catch (e) {
      final errorMessage = DioExceptionHandler.handleDioError(e);
      return Left(errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
