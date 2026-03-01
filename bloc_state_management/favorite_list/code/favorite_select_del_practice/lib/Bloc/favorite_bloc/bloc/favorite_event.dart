part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object?> get props => [];
}

@immutable
class FetchListEvent extends FavoriteEvent {
  const FetchListEvent();
}

@immutable
class FavoriteItemEvent extends FavoriteEvent {
  final FavoriteItemModel item;
  const FavoriteItemEvent({required this.item});
}

@immutable
class SelectedItemEvent extends FavoriteEvent {
  final FavoriteItemModel item;
  const SelectedItemEvent({required this.item});
}

@immutable
class UnSelectedItemEvent extends FavoriteEvent {
  final FavoriteItemModel item;
  const UnSelectedItemEvent({required this.item});
}

@immutable
class DeleteSelectedItemEvent extends FavoriteEvent {
  const DeleteSelectedItemEvent();
}
