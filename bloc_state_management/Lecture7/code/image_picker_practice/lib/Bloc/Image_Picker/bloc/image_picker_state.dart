part of 'image_picker_bloc.dart';

@immutable
class ImagePickerState extends Equatable {
  final XFile? imageFile;
  const ImagePickerState({this.imageFile});
  @override
  List<Object?> get props => [imageFile?.path];

  ImagePickerState copyWith({XFile? imageFile}) {
    return ImagePickerState(imageFile: imageFile ?? this.imageFile);
  }
}
