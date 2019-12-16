import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';


class secondScreen extends StatefulWidget {
  var pickedImage;
  secondScreen({this.})
  _secondScreen createState() => _secondScreen();
}

class _secondScreen extends State<secondScreen> {
  String pickedImage = '';

  @override
Widget build(BuildContext context) {
    print(pickedImage?.lengthSync());
    return Scaffold(
      appBar: AppBar(
          title: Text('Miiii Photo')
      ),
      body: Center(
        child: Image.file(
          _image,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}