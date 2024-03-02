
import 'package:flutter/material.dart';

getScaffold(String content, Color color,BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
    content: Text(content),
    backgroundColor: color,
    duration: const Duration(seconds: 10),
  ));
}
