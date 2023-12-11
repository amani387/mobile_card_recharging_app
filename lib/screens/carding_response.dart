import 'package:flutter/material.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

void main() {
  runApp(const UssdRes());
}

class UssdRes extends StatefulWidget {
  const UssdRes({Key? key}) : super(key: key);

  @override
  State<UssdRes> createState() => _UssdResState();
}

class _UssdResState extends State<UssdRes> {
  late TextEditingController _controller;
  String? _response;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('USSD Plugin Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text input
              TextField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'USSD Code'),
              ),

              // Display response if any
              if (_response != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'USSD Response: $_response',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

              // Buttons
              SingleChildScrollView(
                scrollDirection:Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        UssdAdvanced.sendUssd(
                          code: _controller.text,
                          subscriptionId: 1,
                        );
                      },
                      child: const Text('Normal Request'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String? _res = await UssdAdvanced.sendAdvancedUssd(
                          code: _controller.text,
                          subscriptionId: 1,
                        );
                        setState(() {
                          _response = _res;
                        });
                      },
                      child: const Text('Single Session Request'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String? _res = await UssdAdvanced.multisessionUssd(
                          code: _controller.text,
                          subscriptionId: 1,
                        );
                        setState(() {
                          _response = _res;
                        });
                        String? _res2 = await UssdAdvanced.sendMessage('0');
                        setState(() {
                          _response = _res2;
                        });
                        await UssdAdvanced.cancelSession();
                      },
                      child: const Text('Multi Session Request'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
