import 'dart:io';
import 'package:native_device_features/provider/great_places.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:native_device_features/widgets/image_input.dart';

class AddplaceScreen extends StatefulWidget {
  static const routName = 'AddplaceScreen';
  @override
  _AddplaceScreenState createState() => _AddplaceScreenState();
}

class _AddplaceScreenState extends State<AddplaceScreen> {

  final _titleController = TextEditingController();
  File _pickedImage;
  void _selectedImage(File selectedImage){
    _pickedImage = selectedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty||_pickedImage==null){
      return;
    }
    Provider.of<GreatPlaces>(context,).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10,),
                      ImageInput(_selectedImage),
                    ],
                  ),
                ),
              )
          ),
         Text("user Input"),
          RaisedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              elevation: 0,
            color: Theme.of(context).accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
