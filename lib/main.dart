import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/app.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}
