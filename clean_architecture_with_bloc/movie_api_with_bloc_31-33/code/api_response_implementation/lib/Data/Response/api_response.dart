import 'package:splash_screen_practice/Repositories/Utils/Enums/enum.dart';

class ApiResponse<T> {
  String? errorMessage;
  APIStatus? apiStatus;
  T? data;
  ApiResponse(this.errorMessage, this.apiStatus, this.data);

  ApiResponse.loading() : apiStatus = APIStatus.loading;
  ApiResponse.completed(this.data) : apiStatus = APIStatus.success;
  ApiResponse.failed(this.errorMessage) : apiStatus = APIStatus.failed;
}
