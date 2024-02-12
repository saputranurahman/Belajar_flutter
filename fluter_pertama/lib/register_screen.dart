import 'dart:convert';

import 'package:fluter_pertama/login_screen.dart';
import 'package:fluter_pertama/main.dart';
import 'package:fluter_pertama/providers/api.dart';
import 'package:flutter/material.dart';
import 'package:fluter_pertama/helpers/size_helper.dart';
import 'package:fluter_pertama/output_form_screeen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // mendeskripsikan variabel input
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _isLoading = false;
  bool _isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Welcome Back text
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Register text
          Text(
            'Register',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          // Image
          Container(
            height: 290, // Ganti tinggi sesuai kebutuhan Anda
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/img/register.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Form
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Nama Lengkap TextFormField
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Data Harus Di Isi!!';
                    }
                    return null;
                  },
                ),

                // Email TextFormField
                SizedBox(height: 10),
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

                // Password TextFormField
                SizedBox(height: 10),
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

          // Sudah Punya Akun? text and button
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sudah Punya Akun? "),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
          SizedBox(height: 15),

          // Register Button
          SizedBox(
            width: displayHeight(context) * 0.8,
            height: displayHeight(context) * 0.075,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _register,
            ),
          ),
        ],
      ),
    );
  }

  void _register() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _formKey.currentState!.save();
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    var data = {
      'name': name,
      'email': email,
      'password': password,
      'role': 'member',
    };

    var res = await Api().auth(data, '/register');
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationMenu()),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
