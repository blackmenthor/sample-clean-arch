import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/api.dart';
import 'package:flutter_clean_arch/dialogs.dart';
import 'package:flutter_clean_arch/home.dart';
import 'package:flutter_clean_arch/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? _username;
  String? _password;
  bool _obscurePassword = true;

  bool get btnEnabled => (_username?.isNotEmpty ?? false)
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
                  onPressed: !btnEnabled
                      ? null
                      : () async {
                    final username = _username;
                    final password = _password;

                    showLoadingDialog(context: context);

                    try {
                      await api.login(
                        username: username!,
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
                              'Wrong username or password!',
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
                      text: 'Didn\'t have an account yet? ',
                    ),
                    TextSpan(
                      text: 'Register here',
                      recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (ctx) => const RegisterPage(),
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
