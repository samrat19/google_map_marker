library google_map_marker;

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GoogleMapMarker {
  static Future<BitmapDescriptor> getMarker(BuildContext context, String imagePath) async {
    ByteData byteData = await DefaultAssetBundle.of(context).load(imagePath);
    ui.Codec codec = await ui
        .instantiateImageCodec(byteData.buffer.asUint8List(), targetWidth: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    Uint8List imageData =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
            .buffer
            .asUint8List();

    var marker = BitmapDescriptor.bytes(imageData);

    return marker;
  }
}
