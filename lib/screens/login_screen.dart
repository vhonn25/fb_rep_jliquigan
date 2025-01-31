import 'package:facebook_application/screens/home_screen.dart';
import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facebook_application/widgets/custom_inkwell_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<bool> validateCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    print('Stored Username: $storedUsername');
    print('Stored Password: $storedPassword');
    print('Entered Username: $username');
    print('Entered Password: $password');

    // Check if the stored credentials match the entered ones
    return storedUsername?.trim() == username.trim() &&
        storedPassword?.trim() == password.trim();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_PURPLE_PRIMARY, // Update with your color constant
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(25)),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Vhonster Logo.png', // Replace with your logo
                        height: ScreenUtil().setHeight(200),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your username' : null,
                        fontSize: ScreenUtil().setSp(15),
                        hintText: 'Username',
                        onTap: () {},
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        isObscure: true,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your password' : null,
                        fontSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                        onTap: () {},
                      ),
                      SizedBox(height: ScreenUtil().setHeight(50)),
                      CustomInkwellButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // Get the entered username and password
                            String enteredUsername = usernameController.text;
                            String enteredPassword = passwordController.text;

                            // Validate the entered credentials
                            bool isValid = await validateCredentials(
                                enteredUsername, enteredPassword);

                            if (isValid) {
                             print('Login Successful');
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(username: enteredUsername),
                                ),
                              );
                            } else {
                              // Show error if credentials are invalid
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Login Failed"),
                                  content:
                                      Text("Invalid username or password."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_PURPLE_PRIMARY, // Update with your color constant
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have an account? ',
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: const Color.fromARGB(
                                255, 239, 68, 255), // Update as needed
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
