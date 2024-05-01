import 'package:assessment1/home.dart';
import 'package:assessment1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const HomeScreen(),
    ),
  );
}
