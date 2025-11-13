import 'package:flutter/material.dart';
import 'dart:convert';
import 'screens/login_screen.dart';
import 'services/n8n_service.dart';

void main() {
  runApp(const FlowlinkApp());
}

class FlowlinkApp extends StatelessWidget {
  const FlowlinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flowlink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
