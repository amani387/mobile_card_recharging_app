import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:flutter/material.dart';

class CounterUtil {
  int _counter = 0;

  bool isInitialized = false;

  CounterUtil() {
    // Initialize Mobile Vision in the constructor
    FlutterMobileVision.start().then((value) {
      isInitialized = true;
    });
  }

  void startScan(BuildContext context) async {
    List<OcrText> list = [];

    try {
      // Start the OCR scan
      list = await FlutterMobileVision.read(
        waitTap: true,
        fps: 5,
        multiple: true,
        // Set the percentage of the screen height to scan
        showText: true,
      );


      // Print the OCR results
      for (OcrText text in list) {
        print('Value is: ${text.value}');
      }

    } catch (e) {
      print('Error during OCR scan: $e');
    }
  }
}
