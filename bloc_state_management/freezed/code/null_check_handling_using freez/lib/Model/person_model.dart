import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@Freezed()
abstract class PersonModel with _$PersonModel {
  const factory PersonModel({@Default("") String? name, @Default(0) int? age}) =
      _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
