import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/routes/route_generator.dart';
import 'package:flutter_practice/src/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const LoginPage(),
    );
  }
}
