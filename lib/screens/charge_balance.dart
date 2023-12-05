import 'package:card_recharging_ful_application/utils/direct_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import '../widgets/text_field.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ChargeBalance extends StatefulWidget {
  const ChargeBalance({Key? key});

  @override
  State<ChargeBalance> createState() => _ChargeBalanceState();
}

class _ChargeBalanceState extends State<ChargeBalance> {
 
  TextEditingController hiddenCardNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Call me Back")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: CustomTextField(
                      hintText: "Enter number",
                      controller: hiddenCardNumber,
                      keyboardType: TextInputType.phone,
                      maxLength: 14,
                      error: "",
                    ),
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: () async {
                      print("");
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                String uri = 'tel:*805*${hiddenCardNumber.text}#';
                callNumber(uri);
              },
              child: const Text(
                "Recharge",
                style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
