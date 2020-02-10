import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;



class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  ImageInput(this.onSelectedImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 600);
    if(imageFile == null){
        return;
    }
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectedImage(savedImage);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey)
          ),
          child: _storedImage !=null ? Image.file(_storedImage,fit: BoxFit.cover,width: double.infinity,) : Text("No Image here ",textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10,),
        Expanded(
            child: FlatButton.icon(
                onPressed:_takePicture,
                icon: Icon(Icons.linked_camera),
              label: Text("Take Picture"),
              textColor: Theme.of(context).primaryColor,

            ),
        ),
      ],
    );
  }
}
