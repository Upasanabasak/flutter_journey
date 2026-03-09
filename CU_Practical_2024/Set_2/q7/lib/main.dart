/* 
Develop a Flutter app with a login page that includes the following validation rules: 
  (a) The username must be at least 6 characters long. 
  (b) The password must contain: 
  (i) An uppercase letter 
  (ii) A lowercase letter 
  (iii) Digits 
  (iv) A special character 
  (v) More than 6 characters. 
The login button should be displayed and when clicked, it should show any validation errors if present. 
*/

import 'package:flutter/material.dart';

void main() => runApp(const ValidationApp());

class ValidationApp extends StatelessWidget {
  const ValidationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GlobalKey is required to identify and validate the form
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Regex patterns for password requirements
  final _hasUppercase = RegExp(r'[A-Z]');
  final _hasLowercase = RegExp(r'[a-z]');
  final _hasDigits = RegExp(r'[0-9]');
  final _hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  void _submitForm() {
    // This triggers the validator functions of all TextFormFields in the Form
    if (_formKey.currentState!.validate()) {
      // If form is valid
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Successful!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Username Field
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Username must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length <= 6) {
                    return 'Password must be more than 6 characters';
                  }
                  if (!_hasUppercase.hasMatch(value)) {
                    return 'Include at least one uppercase letter';
                  }
                  if (!_hasLowercase.hasMatch(value)) {
                    return 'Include at least one lowercase letter';
                  }
                  if (!_hasDigits.hasMatch(value)) {
                    return 'Include at least one digit';
                  }
                  if (!_hasSpecialChar.hasMatch(value)) {
                    return 'Include at least one special character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
