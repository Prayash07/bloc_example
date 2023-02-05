import 'package:blocformvalidation/features/auth/bloc/bloc/signin_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin with email"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SigninErrorState) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      state.errorMessage,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context).add(
                  SignInTextChangedEvent(
                    emailController.text,
                    passwordController.text,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context).add(
                  SignInTextChangedEvent(
                    emailController.text,
                    passwordController.text,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SigninLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return CupertinoButton(
                  onPressed: () {
                    BlocProvider.of<SigninBloc>(context).add(
                      SignInSubmittedEvent(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  color:
                      (state is SigninValidState) ? Colors.blue : Colors.grey,
                  child: const Text(
                    "Submit",
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
