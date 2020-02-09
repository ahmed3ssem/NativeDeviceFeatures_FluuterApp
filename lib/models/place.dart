import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocation{
  final double lattiude;
  final double longitude;
  final String address;

  PlaceLocation({
    @required this.lattiude,
    @required this.longitude,
    this.address
  });


}
class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image
  });


}