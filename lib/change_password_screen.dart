import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Change Password",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff0B88BE).withOpacity(0.2),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter your old password',
                  labelText: 'Old Password',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff0B88BE).withOpacity(0.2),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Create your new password',
                  labelText: 'Change Password',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff0B88BE).withOpacity(0.2),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Confirm your new password',
                  labelText: 'Confirm your password',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0B88BE),
              ),
              onPressed: () {
                // Handle password reset logic
                // Navigate to login screen or show success message
              },
              child: const Text(
                'Change Password',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
