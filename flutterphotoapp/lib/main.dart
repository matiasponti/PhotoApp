import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: mainScreen(),
  ));
}

enum AppState {
  free,
  picked,
  cropped,
}

class mainScreen extends StatefulWidget {
  _mainScreen createState() => _mainScreen();
}

class _mainScreen extends State<mainScreen> {
  AppState state;
  File imageFile;
  String btnText="Pick Image";

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  Future pickImageGallery() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {

        state = AppState.picked;
        btnText="Crop Image";
      });
    }
  }

  Future cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
        btnText="Clear Image";

      });
    }
  }



  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if ( image != null ) {
      setState(() {
        imageFile = image;
      });
    }  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Miiiii Foto'),
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
                    onPressed:() {if (state == AppState.free){
      pickImageGallery();

    }

    else if (state == AppState.picked){
      cropImage();

    }
    },
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
                    onPressed: getImageCamera,
                    tooltip: 'Pick Image',
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            )));
  }

  void _savedImage () {}

}
