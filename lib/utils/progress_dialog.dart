import 'package:flutter/material.dart';

import 'colors.dart';

class ProgressDialogPrimary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery
        .of(context)
        .platformBrightness == Brightness.light;
    ;
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(appBlue),
        ),
      ),
      backgroundColor: brightness ? applightgrey.withOpacity(
          0.70) : applightgrey.withOpacity(
          0.70), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
    );
  }
}