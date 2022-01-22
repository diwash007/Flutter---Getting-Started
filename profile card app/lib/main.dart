import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/images/dd.jpg')),
            // child: Image.network(
            //     "https://scontent.fbir2-1.fna.fbcdn.net/v/t1.6435-9/169085537_2487448211562423_5102000500826163191_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=CMl0XCW9IcoAX9iYEpE&_nc_ht=scontent.fbir2-1.fna&oh=00_AT9S1Eo62aryMG2PZ8431NBchnThuMktuNeQpCCdblowyg&oe=62102259"),
            // ),
            Text("Diwash Dahal",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Schuler",
                    fontSize: 40.0,
                    color: Colors.white)),
            Text("FLUTTER DEVELOPER",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    letterSpacing: 5.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
              width: 200.0,
              child: Divider(thickness: 1.0, color: Colors.white),
            ),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.white,
                child: ListTile(
                  leading:
                      Icon(Icons.call, color: Colors.teal.shade800, size: 24.0),
                  title: Text(
                    "+977-9817005507",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Schuler",
                      color: Colors.teal.shade800,
                    ),
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              child: ListTile(
                  leading:
                      Icon(Icons.mail, color: Colors.teal.shade800, size: 24.0),
                  title: Text(
                    "diwashdahal75@gmail.com",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "schuler",
                      color: Colors.teal.shade800,
                    ),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
