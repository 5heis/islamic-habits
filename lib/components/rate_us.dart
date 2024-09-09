import 'package:flutter/material.dart';

class RateUsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Rate Us'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Enjoying our app? Please take a moment to rate Deen Pro!',
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // TODO: Handle the action when the user wants to rate the app (e.g., redirect to app store)
            // Replace this with your app's rating mechanism
            // For example, use launchURL() to open the app's store page
            // launchURL('your_app_store_url');
            Navigator.of(context).pop();
          },
          child: Text('Rate Now',
              style: TextStyle(color: Color.fromARGB(255, 2, 179, 8))),
        ),
        TextButton(
          onPressed: () {
            // Dismiss the dialog
            Navigator.of(context).pop();
          },
          child: Text(
            'Later',
            style: TextStyle(color: Color.fromARGB(255, 2, 179, 8)),
          ),
        ),
      ],
    );
  }
}
