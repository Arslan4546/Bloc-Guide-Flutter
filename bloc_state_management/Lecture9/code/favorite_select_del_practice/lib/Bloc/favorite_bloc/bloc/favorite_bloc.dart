import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_select_del_practice/Model/favorite_item_model.dart';
import 'package:favorite_select_del_practice/Repositories/favorite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteItemModel> favoriteList = [];
  List<FavoriteItemModel> tempSelectedItemsList = [];
  FavoriteRepository favoriteRepository;
  FavoriteBloc(this.favoriteRepository) : super(FavoriteState()) {
    on<FetchListEvent>(fetchListFun);
    on<FavoriteItemEvent>(favItemFun);
    on<SelectedItemEvent>(selectedItem);
    on<UnSelectedItemEvent>(unSelectedItem);
    on<DeleteSelectedItemEvent>(deleteSelectedItem);
  }

  void fetchListFun(FetchListEvent event, Emitter<FavoriteState> emit) async {
    favoriteList = await favoriteRepository.fetchItems();

    emit(
      state.copyWith(
        favoriteItemsList: List.from(favoriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void favItemFun(FavoriteItemEvent event, Emitter<FavoriteState> emit) async {
    final index = favoriteList.indexWhere(
      (element) => element.id == event.item.id,
    );
    if (event.item.isFavorite) {
      if (tempSelectedItemsList.contains(favoriteList[index])) {
        tempSelectedItemsList.remove(favoriteList[index]);
        tempSelectedItemsList.add(event.item);
      }
    } else {
      if (tempSelectedItemsList.contains(favoriteList[index])) {
        tempSelectedItemsList.remove(favoriteList[index]);
        tempSelectedItemsList.add(event.item);
      }
    }

    favoriteList[index] = event.item;
    emit(
      state.copyWith(
        favoriteItemsList: List.from(favoriteList),

        tempSelectedItemsList: List.from(tempSelectedItemsList),
      ),
    );
  }

  void selectedItem(
    SelectedItemEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    tempSelectedItemsList.add(event.item);
    emit(
      state.copyWith(tempSelectedItemsList: List.from(tempSelectedItemsList)),
    );
  }

  void unSelectedItem(
    UnSelectedItemEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    tempSelectedItemsList.remove(event.item);
    emit(
      state.copyWith(tempSelectedItemsList: List.from(tempSelectedItemsList)),
    );
  }

  void deleteSelectedItem(
    DeleteSelectedItemEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    for (var i = 0; i < tempSelectedItemsList.length; i++) {
      favoriteList.remove(tempSelectedItemsList[i]);
    }
    tempSelectedItemsList.clear();
    emit(
      state.copyWith(
        tempSelectedItemsList: List.from(tempSelectedItemsList),
        favoriteItemsList: List.from(favoriteList),
      ),
    );
  }
}
