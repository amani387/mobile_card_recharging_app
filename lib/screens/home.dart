import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFFFFFF),
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.qr_code),
                  onPressed: () {
                    // Handle QR code icon tap
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle call icon tap
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Handle settings icon tap
                  },
                ),
              ),
            ],
          ),
          drawer: buildMyDrawer(context),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: kToolbarHeight + 100.0, // Adjust the height as needed
                    color: Color(0xFF51C25B), // Set your desired background color
                  ),
                  Positioned(
                    left: -120.0,
                    bottom: -0.0,
                    child: Container(
                      width: 500.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF51C25B),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle recharge button tap
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 50.0,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors
                                    .orangeAccent, // Set your desired background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust corner radius as needed
                              ),
                              child: Text(
                                'package',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle balance button tap
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 50.0,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors
                                    .orangeAccent, // Set your desired background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust corner radius as needed
                              ),
                              child: Text(
                                'call me back',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0), // Adjust spacing between rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle call me back button tap
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 50.0,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors
                                    .orangeAccent, // Set your desired background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust corner radius as needed
                              ),
                              child: Text(
                                'Recharge',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle package button tap
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 50.0,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors
                                    .orangeAccent, // Set your desired background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust corner radius as needed
                              ),
                              child: Text(
                                'check balance',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.0),
            ],
          ),

        ),


        Positioned(
          left: -60.0, // Align to the left edge of the screen
          bottom: -250.0,
          child: Container(
            width: 500.0, // Set width to screen width
            height: 450.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),

        Positioned(
          left: 0.0, // Align to the left edge of the screen
          bottom: 100.0,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                'Welcome to Memuya ',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.black, // Set the text color to black
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                    // You can adjust this property as needed
                ),
              ),
            ),

          ),
        ),

        Positioned(
          left: 0.0,
          bottom: 60.0,
          child: Container(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                'Follow the steps to save',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),

      ],

    );
  }
}
