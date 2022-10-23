import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/cubit/login_cubit.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/cubit/login_state.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';
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
          ctx.showSnackbar(
            type: SnackBarType.error,
            message: state.error.userFriendlyMessage,
          );
        } else if (state is LoggedInLoginState) {
          ctx.showSnackbar(
            message: ctx.l10n.loginSuccess,
          );
          context.replace('/journal');
        }
      },
      builder: (ctx, state) {
        return SizedBox(
          width: double.infinity,
          child: MaterialButton(
            key: const ValueKey('login_btn'),
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
