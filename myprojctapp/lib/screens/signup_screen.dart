import 'package:custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';


class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Email',
              controller: emailController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: 'Password',
              controller: passwordController,
              obscure: true,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: 'Confirm Password',
              controller: confirmPasswordController,
              obscure: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add signup logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
