import 'package:equatable/equatable.dart';

class FavoriteItemModel extends Equatable {
  final int id;
  final String value;
  final bool isFavorite;
  final bool isDeleting;

  const FavoriteItemModel({
    required this.id,
    required this.value,
    this.isFavorite = false,
    this.isDeleting = false,
  });

  FavoriteItemModel copyWith({
    int? id,
    String? value,
    bool? isFavorite,
    bool? isDeleting,
  }) {
    return FavoriteItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props => [id, value, isFavorite, isDeleting];
}
