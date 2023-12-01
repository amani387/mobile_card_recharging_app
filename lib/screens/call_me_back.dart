import 'package:flutter/material.dart';
import 'package:card_recharging_ful_application/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallMeBack extends StatefulWidget {
  const CallMeBack({super.key});

  @override
  State<CallMeBack> createState() => _CallMeBackState();
}

class _CallMeBackState extends State<CallMeBack> {
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Call me Back")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Phone Number :"),
            CustomTextField(
              hintText: "Enter phone number",
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
            ),
            ElevatedButton(
                onPressed: () {
                  String uri = 'tel:*807*${ cleanNumber(phoneNumberController.text)}#';
               
                  _callNumber(uri);
                },
                child: const Text(
                  "Send",
                  style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
                ))
          ],
        ),
      ),
    );
  }

  cleanNumber(String number) {
    if (phoneNumberController.text.length > 10) {
      return '0${phoneNumberController.text.substring(4)}';
    } else {
      return number;
    }
  }

  _callNumber(String number) async {
 
    return await FlutterPhoneDirectCaller.callNumber(number);
  }
}