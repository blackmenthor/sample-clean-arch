import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/cubit/login_cubit.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/cubit/login_state.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget _usernameWidget(BuildContext context) {
    return BlocBuilder<LoginCubit, BaseCubitState>(
      bloc: context.read<LoginCubit>(),
      builder: (ctx, state)
      => TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'Enter your username here',
        ),
        onChanged: (newUsername) {
          context.read<LoginCubit>().setUsername(username: newUsername);
        },
      ),
    );
  }

  Widget _passwordWidget(BuildContext context) {
    return BlocBuilder<LoginCubit, BaseCubitState>(
      bloc: context.read<LoginCubit>(),
      builder: (ctx, state)
      => TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter your password here',
          suffixIcon: InkWell(
            onTap: () {
              context.read<LoginCubit>().setObscure(
                obscure: !state.obscurePassword,
              );
            },
            child: Icon(
              (state as LoginState).obscurePassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye,
              size: 14.0,
            ),
          ),
        ),
        obscureText: state.obscurePassword,
        onChanged: (newPassword) {
          context.read<LoginCubit>().setPassword(password: newPassword);
        },
      ),
    );
  }

  Widget _button(BuildContext context) {
    return BlocConsumer<LoginCubit, BaseCubitState>(
      listener: (ctx, state) {
        if (state is ErrorLoginState) {
          // TODO: move to function
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                state.error.userFriendlyMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          );
        } else if (state is LoggedInLoginState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  // TODO: move to locale
                  'Logged in successfully!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
          );
          context.replace('/journal');
        }
      },
      builder: (ctx, state) {
        return SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: Colors.blue,
            disabledColor: Colors.blue.withOpacity(0.5),
            onPressed: !(state as LoginState).canSubmit
                ? null
                : () async {
              context.read<LoginCubit>().login();
            },
            child: state is LoadingLoginState
            ? const Center(
              child: SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(),
              ),
            )
                : const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Builder(
        builder: (context)
          => Scaffold(
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
                    _usernameWidget(context),
                    const SizedBox(height: 8,),
                    _passwordWidget(context),
                    const SizedBox(height: 16,),
                    _button(context),
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
                              ..onTap = () => context.replace('/register'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}


// class LoginPage extends StatefulWidget {
//   const LoginPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   String? _username;
//   String? _password;
//   bool _obscurePassword = true;
//
//   bool get btnEnabled => (_username?.isNotEmpty ?? false)
//     && (_password?.isNotEmpty ?? false);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 16.0,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               const Text('Login here'),
//               const SizedBox(height: 16,),
//               TextField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Username',
//                   hintText: 'Enter your username here',
//                 ),
//                 onChanged: (newUsername) {
//                   setState(() {
//                     _username = newUsername;
//                   });
//                 },
//               ),
//               const SizedBox(height: 8,),
//               TextField(
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'Password',
//                   hintText: 'Enter your password here',
//                   suffixIcon: InkWell(
//                     onTap: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                     child: Icon(
//                       _obscurePassword
//                           ? Icons.remove_red_eye_outlined
//                           : Icons.remove_red_eye,
//                       size: 14.0,
//                     ),
//                   ),
//                 ),
//                 obscureText: _obscurePassword,
//                 onChanged: (newPassword) {
//                   setState(() {
//                     _password = newPassword;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16,),
//               SizedBox(
//                 width: double.infinity,
//                 child: MaterialButton(
//                   color: Colors.blue,
//                   disabledColor: Colors.blue.withOpacity(0.5),
//                   onPressed: !btnEnabled
//                       ? null
//                       : () async {
//                     // final username = _username;
//                     // final password = _password;
//                     //
//                     // showLoadingDialog(context: context);
//                     //
//                     // try {
//                     //   await api.login(
//                     //     username: username!,
//                     //     password: password!,
//                     //   );
//                     //
//                     //   ScaffoldMessenger.of(context).showSnackBar(
//                     //     const SnackBar(
//                     //       backgroundColor: Colors.green,
//                     //       content: Text(
//                     //         'Login success!',
//                     //       ),
//                     //     ),
//                     //   );
//                     //
//                     //   Navigator.pop(context);
//                     //
//                     //   Navigator.pushReplacement(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (ctx) => const HomePage(),
//                     //     ),
//                     //   );
//                     // } catch (ex) {
//                     //   print(ex.toString());
//                     //   Navigator.pop(context);
//                     //   ScaffoldMessenger.of(context).showSnackBar(
//                     //     const SnackBar(
//                     //         backgroundColor: Colors.redAccent,
//                     //         content: Text(
//                     //           'Wrong username or password!',
//                     //         ),
//                     //     ),
//                     //   );
//                     // }
//                   },
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16,),
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     const TextSpan(
//                       text: 'Didn\'t have an account yet? ',
//                     ),
//                     TextSpan(
//                       text: 'Register here',
//                       recognizer: TapGestureRecognizer()
//                           ..onTap = () => context.replace('/register'),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
