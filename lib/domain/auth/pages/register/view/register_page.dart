import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/domain/auth/pages/register/cubit/register_cubit.dart';
import 'package:flutter_clean_arch/domain/auth/pages/register/cubit/register_state.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _usernameWidget(BuildContext context) {
    return BlocBuilder<RegisterCubit, BaseCubitState>(
      bloc: context.read<RegisterCubit>(),
      builder: (ctx, state)
      => TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'Enter your username here',
        ),
        onChanged: (newUsername) {
          context.read<RegisterCubit>().setUsername(username: newUsername);
        },
      ),
    );
  }

  Widget _firstnameWidget(BuildContext context) {
    return BlocBuilder<RegisterCubit, BaseCubitState>(
      bloc: context.read<RegisterCubit>(),
      builder: (ctx, state)
      => TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'First name',
          hintText: 'Enter your first name here',
        ),
        onChanged: (newFirstname) {
          context.read<RegisterCubit>().setFirstname(firstname: newFirstname);
        },
      ),
    );
  }

  Widget _passwordWidget(BuildContext context) {
    return BlocBuilder<RegisterCubit, BaseCubitState>(
      bloc: context.read<RegisterCubit>(),
      builder: (ctx, state)
      => TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter your password here',
          suffixIcon: InkWell(
            onTap: () {
              context.read<RegisterCubit>().setObscure(
                obscure: !state.obscurePassword,
              );
            },
            child: Icon(
              (state as RegisterState).obscurePassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye,
              size: 14.0,
            ),
          ),
        ),
        obscureText: state.obscurePassword,
        onChanged: (newPassword) {
          context.read<RegisterCubit>().setPassword(password: newPassword);
        },
      ),
    );
  }

  Widget _button(BuildContext context) {
    return BlocConsumer<RegisterCubit, BaseCubitState>(
      listener: (ctx, state) {
        if (state is ErrorRegisterState) {
          ctx.showSnackbar(
            type: SnackBarType.error,
            message: state.error.userFriendlyMessage,
          );
        } else if (state is RegisteredState) {
          ctx.showSnackbar(
            message: ctx.l10n.registerSuccess,
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
            onPressed: !(state as RegisterState).canSubmit
                ? null
                : () async {
              context.read<RegisterCubit>().register();
            },
            child: state is LoadingRegisterState
                ? const Center(
              child: SizedBox(
                height: 14,
                width: 14,
                child: CircularProgressIndicator(),
              ),
            )
                : const Text(
              'Register',
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
      create: (_) => RegisterCubit(),
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
                  const Text('Register here'),
                  const SizedBox(height: 16,),
                  _usernameWidget(context),
                  const SizedBox(height: 8,),
                  _firstnameWidget(context),
                  const SizedBox(height: 8,),
                  _passwordWidget(context),
                  const SizedBox(height: 16,),
                  _button(context),
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
                            ..onTap = () => context.replace('/login'),
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
