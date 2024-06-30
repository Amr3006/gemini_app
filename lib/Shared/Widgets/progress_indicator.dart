import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    Widget indicator = CircularProgressIndicator(color: Colors.white.withOpacity(0.85),);
    if (Platform.isIOS) {
      indicator = const CupertinoActivityIndicator();
    }
    return Center(
      child: indicator,
    );
  }

}