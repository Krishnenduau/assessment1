import 'package:assessment1/view/home.dart';
import 'package:assessment1/view_model/provider.dart';
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
