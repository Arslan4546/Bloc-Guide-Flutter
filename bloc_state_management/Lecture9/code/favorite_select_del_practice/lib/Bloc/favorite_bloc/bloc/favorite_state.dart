part of 'favorite_bloc.dart';

enum ListStatus { loading, success, failed }

@immutable
class FavoriteState extends Equatable {
  final List<FavoriteItemModel> favoriteItemsList;
  final List<FavoriteItemModel> tempSelectedItemsList;
  final ListStatus listStatus;
  const FavoriteState({
    this.favoriteItemsList = const [],
    this.tempSelectedItemsList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriteState copyWith({
    List<FavoriteItemModel>? favoriteItemsList,
    List<FavoriteItemModel>? tempSelectedItemsList,
    ListStatus? listStatus,
  }) {
    return FavoriteState(
      favoriteItemsList: favoriteItemsList ?? this.favoriteItemsList,
      listStatus: listStatus ?? this.listStatus,
      tempSelectedItemsList:
          tempSelectedItemsList ?? this.tempSelectedItemsList,
    );
  }

  @override
  List<Object?> get props => [
    favoriteItemsList,
    listStatus,
    tempSelectedItemsList,
  ];
}
