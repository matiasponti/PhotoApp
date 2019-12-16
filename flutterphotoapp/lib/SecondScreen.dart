import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';


class secondScreen extends StatefulWidget {
  var pickedImage;
  secondScreen({this.pickedImage});
  _secondScreen createState() => _secondScreen();
}

class _secondScreen extends State<secondScreen> {

  @override
Widget build(BuildContext context) {
    print(widget.pickedImage?.lengthSync());
    return Scaffold(
      appBar: AppBar(
          title: Text('Miiii Photo')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(
              widget.pickedImage,
              height: 200,
              width: 200,
            ),
            Container(
                margin: const EdgeInsets.only(top: 40.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                  child: Text("Back to main menu"),
                  onPressed: () {
                    Navigator.pop(context, true);}),
            )
          ],
        ),
      ),
    );
  }
}