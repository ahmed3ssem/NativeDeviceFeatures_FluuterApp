import 'package:flutter/material.dart';
import 'package:native_device_features/provider/great_places.dart';
import 'package:native_device_features/screens/add_place_screen.dart';
import 'package:provider/provider.dart';


class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: ()=>Navigator.of(context).pushNamed(AddplaceScreen.routName)
          )
        ],
      ),
      body:Consumer<GreatPlaces>(child: Center(child: Text("Messi"),),builder: (context,greatPlace,ch)=> greatPlace.items.length<=0 ? ch
          :ListView.builder(
      itemCount: greatPlace.items.length,
          itemBuilder: (context , index)=>ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(greatPlace.items[index].image),
            ),
            title: Text(greatPlace.items[index].title),
            onTap: (){},
          )),
      )
    );
  }
}
