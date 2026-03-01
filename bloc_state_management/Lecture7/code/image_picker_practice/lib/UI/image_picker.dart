import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_practice/Bloc/Image_Picker/bloc/image_picker_bloc.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker')),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.imageFile == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(
                    GalleryImagePickerEvent(),
                  );
                },
                child: CircleAvatar(child: Icon(Icons.camera)),
              );
            } else {
              return Image.network(
                state.imageFile!.path.toString(),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              );
            }
          },
        ),
      ),
    );
  }
}
