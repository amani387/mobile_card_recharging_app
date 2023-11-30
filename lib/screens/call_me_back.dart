import 'package:card_recharging_ful_application/utils/direct_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import '../widgets/text_field.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallMeBack extends StatefulWidget {
  const CallMeBack({Key? key});

  @override
  State<CallMeBack> createState() => _CallMeBackState();
}

class _CallMeBackState extends State<CallMeBack> {
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  List<Contact>? _contacts;
  String _userName = '';
  String _phoneNumber = '';
  String _phoneNumberStartBy = "+";
  String checkPhoneNumber = '';
  String error = "";
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
          _buildUserNameWidget(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: CustomTextField(
                      hintText: "Enter phone number",
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      error: error.isNotEmpty ? error : '',
                      onChanged: (e) => _handlePhoneNumberChange(e),
                      maxLength: _phoneNumberStartBy == "+" ? 13 : 10,
                    ),
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: () async {
                      await _pickContact();
                    },
                    icon: const Icon(Icons.contact_phone_sharp),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                String uri = 'tel:*807*${cleanNumber(phoneNumberController.text)}#';
                callNumber(uri);
              },
              child: const Text(
                "Send",
                style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildUserNameWidget() {
    if (_userName.isNotEmpty && _phoneNumber.contains(checkPhoneNumber)) {
      return Text("To: $_userName");
    } else {
      return SizedBox.shrink();
    }
  }

  void _handlePhoneNumberChange(String e) {
    setState(() {
      if (e.isEmpty) {
        error = "";
      } else if (e.startsWith("0") || e.startsWith("+251")) {
        _phoneNumberStartBy = e.startsWith("+251") ? "+" : "0";
        error = e.length >= 10 && _phoneNumberStartBy == "0"
            ? "Max 10 digits reached"
            : e.length >= 13 && _phoneNumberStartBy == "+"
                ? "Max 13 digits reached"
                : "";
      }else if(e.isNotEmpty){
        checkPhoneNumber=e;
      }
       else {
        error = "Should start with 0 or +251";
      }
    });
  }

  Future<void> _pickContact() async {
    try {
      Contact? contact = await _contactPicker.selectContact();
      if (contact != null) {
        setState(() {
          _contacts = [contact];
          _userName = _contacts![0].fullName.toString();
          phoneNumberController.text = _contacts![0].phoneNumbers!.first;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  String cleanNumber(String number) {
    return phoneNumberController.text.length > 10
        ? '0${phoneNumberController.text.substring(4)}'
        : number;
  }
}
