import 'package:api_practice_with_bloc/Model/post_model.dart';
import 'package:api_practice_with_bloc/Repositories/api_repository.dart';
import 'package:api_practice_with_bloc/Utils/api_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  List<PostModel> filteredList = [];
  ApiRepository apiRepository;
  ApiBloc(this.apiRepository) : super(ApiState()) {
    on<FetchApiDataEvent>(fetchData);
    on<QueryEvent>(queryFun);
  }

  void fetchData(FetchApiDataEvent event, Emitter<ApiState> emit) async {
    await apiRepository
        .fetchPosts()
        .then((data) {
          emit(state.copyWith(dataList: data, status: APIStatus.success));
        })
        .catchError((error) {
          emit(
            state.copyWith(
              errorMessage: error.toString(),
              status: APIStatus.failed,
            ),
          );
        });
  }

  void queryFun(QueryEvent event, Emitter<ApiState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(filteredList: [], listError: ""));
      return;
    } else {
      filteredList = state.dataList
          .where(
            (post) =>
                post.email!.toLowerCase().contains(event.query.toLowerCase()),
          )
          .toList();
      if (filteredList.isEmpty) {
        emit(state.copyWith(filteredList: [], listError: "No Data Found"));
      } else {
        emit(state.copyWith(filteredList: filteredList));
      }
    }
  }
}
