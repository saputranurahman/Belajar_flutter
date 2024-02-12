import 'dart:convert';

import 'package:fluter_pertama/main.dart';
import 'package:fluter_pertama/providers/api.dart';
import 'package:fluter_pertama/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluter_pertama/helpers/size_helper.dart';
import 'package:fluter_pertama/output_form_screeen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  bool _isHiddenPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Back text
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Login text
            Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // Image
            Container(
              height: 290,
              width: double.infinity, // Ganti tinggi sesuai kebutuhan Anda
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/img/login.jpg',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 10),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email TextFormField
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email Harus Di Isi!!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  // Password TextFormField
                  TextFormField(
                    controller: passwordController,
                    obscureText: _isHiddenPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isHiddenPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isHiddenPassword = !_isHiddenPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password Harus Di Isi!!';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Register text and button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Belum Punya Akun? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),

            SizedBox(height: 15),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: displayHeight(context) * 0.075,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),

                ),
                onPressed: _login,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    try {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      } else {
        setState(() {
          _isLoading = true;
        });

        _formKey.currentState!.save();
        String email = emailController.text;
        String password = passwordController.text;

        var data = {'email': email, 'password': password};
        var res = await Api().auth(data, '/login');

        if (res.statusCode == 200) {
          var body = json.decode(res.body);
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('token', json.encode(body['token']));
          localStorage.setString('user', json.encode(body['user']));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationMenu()),
          );
        } else {
          // Handle login error, show an error message to the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed. Please check your credentials."),
              duration: Duration(seconds: 3),
            ),
          );

          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      // Handle other unexpected errors
      print("Unexpected error during login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An unexpected error occurred. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }
}
