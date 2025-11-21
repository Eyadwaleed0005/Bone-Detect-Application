import 'dart:io';

import 'package:bonedetect/core/api/end_points.dart';
import 'package:bonedetect/core/dio_helper/dio_error_handler.dart';
import 'package:bonedetect/core/dio_helper/dio_helper.dart';
import 'package:bonedetect/ui/home_screen/data/model/fracture_result_model.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class FractureResultRepo {
  Future<Either<String, FractureResultModel>> predictFracture({
    required File imageFile,
    String fileFieldName = 'file',
    Map<String, dynamic>? extraData,
  }) async {
    try {
      final response = await DioHelper.uploadFile(
        url: EndPoints.predictModel,
        file: imageFile,
        fileFieldName: fileFieldName,
        data: extraData,
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final model = FractureResultModel.fromJson(data);
        return Right(model);
      }

      return Left(data.toString());
    } on DioException catch (e) {
      final message = DioExceptionHandler.handleDioError(e);
      return Left(message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
