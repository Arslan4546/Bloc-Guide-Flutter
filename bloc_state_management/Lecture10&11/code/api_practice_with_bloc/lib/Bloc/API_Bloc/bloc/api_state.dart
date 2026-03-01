part of 'api_bloc.dart';

class ApiState extends Equatable {
  final String errorMessage;
  final List<PostModel> dataList;
  final List<PostModel> filteredList;
  final APIStatus status;
  final String listError;

  const ApiState({
    this.errorMessage = '',
    this.dataList = const [],
    this.filteredList = const [],
    this.listError = '',
    this.status = APIStatus.loading,
  });

  ApiState copyWith({
    String? errorMessage,
    List<PostModel>? dataList,
    APIStatus? status,
    List<PostModel>? filteredList,
    String? listError,
  }) {
    return ApiState(
      errorMessage: errorMessage ?? this.errorMessage,
      dataList: dataList ?? this.dataList,
      status: status ?? this.status,
      filteredList: filteredList ?? this.filteredList,
      listError: listError ?? this.listError,
    );
  }

  @override
  List<Object> get props => [
    errorMessage,
    dataList,
    status,
    filteredList,
    listError,
  ];
}
