import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/api.dart';
import 'package:flutter_clean_arch/dialogs.dart';
import 'package:flutter_clean_arch/home.dart';
import 'package:flutter_clean_arch/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String? _username;
  String? _firstName;
  String? _password;
  bool _obscurePassword = true;

  bool get btnEnabled => (_username?.isNotEmpty ?? false)
      && (_firstName?.isNotEmpty ?? false)
      && (_password?.isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Login here'),
              const SizedBox(height: 16,),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your username here',
                ),
                onChanged: (newUsername) {
                  setState(() {
                    _username = newUsername;
                  });
                },
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  hintText: 'Enter your first name here',
                ),
                onChanged: (newFirstName) {
                  setState(() {
                    _firstName = newFirstName;
                  });
                },
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password here',
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Icon(
                      _obscurePassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      size: 14.0,
                    ),
                  ),
                ),
                obscureText: _obscurePassword,
                onChanged: (newPassword) {
                  setState(() {
                    _password = newPassword;
                  });
                },
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    final username = _username;
                    final password = _password;
                    final firstName = _firstName;

                    showLoadingDialog(context: context);

                    try {
                      await api.register(
                        username: username!,
                        firstName: firstName!,
                        password: password!,
                      );

                      Navigator.pop(context);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const HomePage(),
                        ),
                      );
                    } catch (ex) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Failed to register!',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Already have an account? ',
                    ),
                    TextSpan(
                      text: 'Login here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(
                              builder: (ctx) => const LoginPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
