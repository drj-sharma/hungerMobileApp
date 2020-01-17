import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[400],
      child: Center(
        child: SpinKitWave(
          color: Colors.purple,
          size: 60.0,
        ),
      ),
    );
  }
}
