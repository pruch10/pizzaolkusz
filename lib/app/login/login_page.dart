import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var errorMessage = '';

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Zaloguj się'),
              const SizedBox(height: 20),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(hintText: 'Login'),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text);
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                      print(error);
                    }
                  },
                  child: const Text('Zaloguj się'))
            ],
          ),
        ),
      ),
    );
  }
}