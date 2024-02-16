import 'package:belajar_getx/app/helpers/size_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  var _isLoading = false;
  bool _isHiddenPassword = true;
  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Image.network(
              ' ',
              fit: BoxFit.cover,
            ),
          ),

          // Form
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                // Nama Lengkap TextFormField
                SizedBox(height: 10),
                TextFormField(
                  // controller: nameController,
                  onChanged: controller.onNameChanged,
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
                  onChanged: controller.onEmailChanged,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Email Tidak Boleh Kosong',
                        backgroundColor: const Color.fromARGB(82, 0, 0, 0),
                        colorText: Colors.black,
                      );
                      return 'Email Harus Di Isi!!';
                    }
                    return null;
                  },
                ),

                // Password TextFormField
                SizedBox(height: 10),
                TextFormField(
                  // controller: passwordController,
                  onChanged: controller.onPasswordChanged,
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
                        // if (controller.formKey.currentState!.validate()) {
                        //   controller.register();
                        // }
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
                SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: controller.onconfirmPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "kofirmasi Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginScreen()),
                  // );
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
              onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.register();
                        }
                      },
            ),
          ),
        ],
      ),
    );
  }
}
