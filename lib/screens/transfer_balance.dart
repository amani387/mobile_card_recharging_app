import 'package:card_recharging_ful_application/utils/direct_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import '../widgets/text_field.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class TransferBalance extends StatefulWidget {
  const TransferBalance({Key? key});

  @override
  State<TransferBalance> createState() => _TransferBalanceState();
}

class _TransferBalanceState extends State<TransferBalance> {
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  List<Contact>? _contacts;
  String _userName = '';
  String _phoneNumber = '';
  String _phoneNumberStartBy = "+";
  String checkPhoneNumber = '';
  String error = "";
  List<num> amount = [5, 10, 15, 20, 25, 50];
  String selectedBalanceToTransfer = "";
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cardAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transfer Balance")),
      body: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserNameWidget(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: CustomTextField(
                      label: "Phone Number",
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
            SizedBox(
              height: 15,
            ),
            SizedBox(
              child: CustomTextField(
                label: "Custom Amount",
                hintText: "Enter Amount",
                controller: cardAmountController,
                keyboardType: TextInputType.phone,
                error: error.isNotEmpty ? error : '',
                onChanged: (e) {
                  setState(() {
                    cardAmountController.text = e;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 8.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                  ),
                  itemCount: amount.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          cardAmountController.text = amount[index].toString();
                        });
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        child: GridTile(
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                '${amount[index]}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String uri =
                    'tel:*806*${cleanNumber(phoneNumberController.text)}*${cardAmountController.text}*1#';
                callNumber(uri);
                print("Uri ********* $uri  ******");
              },
              child: const Text(
                "Transfer",
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
      return const SizedBox.shrink();
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
      } else if (e.isNotEmpty) {
        checkPhoneNumber = e;
      } else {
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
