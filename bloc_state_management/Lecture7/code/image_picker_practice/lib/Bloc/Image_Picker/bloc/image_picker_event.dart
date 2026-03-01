part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {
  const ImagePickerEvent();
}

@immutable
class CameraImagePickerEvent extends ImagePickerEvent {
  const CameraImagePickerEvent();
}

@immutable
class GalleryImagePickerEvent extends ImagePickerEvent {
  const GalleryImagePickerEvent();
}
