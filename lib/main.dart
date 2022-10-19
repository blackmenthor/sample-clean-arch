import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/home.dart';
import 'package:flutter_clean_arch/login.dart';
import 'package:flutter_clean_arch/shared_prefs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool get isLoggedIn => prefs.isLoggedIn;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      while (!prefs.initialized) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
      setState(() {
        _initialized = true;
      });
    });
  }

  Widget body(BuildContext context) {
    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text(
                'Initializing app...',
              ),
            ],
          ),
        ),
      );
    }

    if (!isLoggedIn) {
      return const LoginPage();
    }
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: body(context),
    );
  }
}
