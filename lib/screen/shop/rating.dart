// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rating_dialog/rating_dialog.dart';
//
// final _dialog = RatingDialog(
//   initialRating: 1.0,
//   // your app's name?
//   title: Text(
//     'Rating Dialog',
//     textAlign: TextAlign.center,
//     style: const TextStyle(
//       fontSize: 25,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
//   // encourage your user to leave a high rating?
//   message: Text(
//     'Tap a star to set your rating. Add more description here if you want.',
//     textAlign: TextAlign.center,
//     style: const TextStyle(fontSize: 15),
//   ),
//   // your app's logo?
//   image: const FlutterLogo(size: 100),
//   submitButtonText: 'Submit',
//   commentHint: 'Set your custom comment hint',
//   onCancelled: () => print('cancelled'),
//   onSubmitted: (response) {
//     print('rating: ${response.rating}, comment: ${response.comment}');
//
//
//   },
// );
//
// void showDialogRating(BuildContext context){
//   // show the dialog
//   showDialog(
//     context: context,
//     barrierDismissible: true, // set to false if you want to force a rating
//     builder: (context) => _dialog,
//   );
//
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double rating = 3.5;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Rating"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: StarRating(
              size: 40.0,
              rating: rating,
              color: Colors.orange,
              borderColor: Colors.grey,
              allowHalfRating: true,
              starCount: starCount,
              onRatingChanged: (rating) => setState(() {
                this.rating = rating;
              }),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Your rating is: $rating",
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}