import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Future<void> updateProfile(String username, String email, String firstName, String lastName) async {
    final response = await http.put(
      Uri.parse('http://your-django-server.com/users/update_profile/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token your_auth_token',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
      }),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Profile updated.');
    } else {
      // Handle error
      print('Failed to update profile.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(hintText: 'Enter your username'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Enter your email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(hintText: 'Enter your first name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(hintText: 'Enter your last name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProfile(
                  usernameController.text,
                  emailController.text,
                  firstNameController.text,
                  lastNameController.text,
                );
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
