import 'package:calci/CalciBody.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calci());

class Calci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalciBody(),
    );
  }
}
