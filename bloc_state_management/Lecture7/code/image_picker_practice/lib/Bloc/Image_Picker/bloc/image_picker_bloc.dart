import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_practice/Utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils _imagePickerUtils;
  ImagePickerBloc(this._imagePickerUtils) : super(ImagePickerState()) {
    on<CameraImagePickerEvent>(_onCameraImagePicker);
    on<GalleryImagePickerEvent>(_onGalleryImagePicker);
  }

  void _onCameraImagePicker(
    CameraImagePickerEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await _imagePickerUtils.pickImageFromCamera();
    emit(state.copyWith(imageFile: file));
  }

  void _onGalleryImagePicker(
    GalleryImagePickerEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await _imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(imageFile: file));
  }
}
