library google_map_marker;

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart';

///here is the class
///
///
abstract class GoogleMapMarker {

  ///this function returns a [Future] type of [BitmapDescriptor]
  ///
  ///
  static Future<BitmapDescriptor> getMarker(BuildContext context, String imagePath) async {

    ///load the image path from asset
    ///
    ///
    ByteData byteData = await DefaultAssetBundle.of(context).load(imagePath);
    ui.Codec codec = await ui
        .instantiateImageCodec(byteData.buffer.asUint8List(), targetWidth: 100);
    ui.FrameInfo fi = await codec.getNextFrame();

    ///converts to [Uint8List]
    ///
    ///
    Uint8List imageData =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
            .buffer
            .asUint8List();

    var marker = BitmapDescriptor.bytes(imageData);

    return marker;
  }
}
