import 'package:flutter/material.dart';
import 'package:flutterphotoapp/SecondScreen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: mainScreen(),
  ));
}


class mainScreen extends StatefulWidget {
  _mainScreen createState() => _mainScreen();
}

class _mainScreen extends State<mainScreen> {
  File pickedImage;

  getImageFile(ImageSource Source) async {
    var image = await ImagePicker.pickImage(source: Source);
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    setState(() {
      pickedImage = croppedFile;
      print(pickedImage.lengthSync());
    });
    if (pickedImage != null) { Navigator.push(context,
        MaterialPageRoute(builder:
            (context)=> secondScreen(pickedImage: pickedImage,))); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Miiii Foto'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                    onPressed: () => getImageFile(ImageSource.gallery),
                    tooltip: 'Pick Image',
                    icon: Icon(Icons.grid_on),
                  ),
                ),
                // the arguments in the onGenerateRoute function and pass them
                // to the screen.
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black),
                  ),
                  margin: const EdgeInsets.only(top: 40.0),
                  child: IconButton(
                    onPressed: () => getImageFile(ImageSource.camera),
                    tooltip: 'Pick Image',
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            )));
  }


}
