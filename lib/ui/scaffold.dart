import 'package:flutter/material.dart';

/// Key used to locate the current scaffold from anywhere in the app. Useful for
/// accessing scaffold functionality like SnackBars from outside the widget tree.
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void _showSnackbar(String message, Color color) {
  scaffoldMessengerKey.currentState!
    ..clearSnackBars()
    ..showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
}

/// Shows a green [SnackBar] with a success [message].
void showSuccessSnackbar(String message) {
  _showSnackbar(message, Colors.green);
}

/// Shows a red [SnackBar] with an error [message].
void showErrorSnackbar(String message) {
  _showSnackbar(message, Colors.red);
}
