import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _firstInputController = TextEditingController();
  TextEditingController _secondInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Input Boxes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstInputController,
              decoration: InputDecoration(
                labelText: 'First Input',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _secondInputController,
              decoration: InputDecoration(
                labelText: 'Second Input',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Access the input values using the controllers
                String firstInput = _firstInputController.text;
                String secondInput = _secondInputController.text;

                // Do something with the input values, e.g., print them
                print('First Input: $firstInput');
                print('Second Input: $secondInput');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
