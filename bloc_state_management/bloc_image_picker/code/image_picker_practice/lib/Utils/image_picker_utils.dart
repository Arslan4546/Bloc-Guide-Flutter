import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  // this is the image picker instance that will be used to pick images from camera or gallery
  final ImagePicker _picker = ImagePicker();
  // this is the function that allows you to pick an image from the camera
  Future<XFile?> pickImageFromCamera() async {
    final XFile? imageFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    return imageFile;
  }

  // this is the function that allows you to pick an image from the gallery
  Future<XFile?> pickImageFromGallery() async {
    final XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    return imageFile;
  }
}
