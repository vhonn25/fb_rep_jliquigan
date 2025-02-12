import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/custom_inkwell_button.dart';
import 'package:facebook_application/widgets/custom_textformfield.dart';
import 'package:facebook_application/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const RegisterScreen({super.key, Key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  String? firstNameError;
  String? lastNameError;
  String? mobileError;
  String? usernameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void showValidationDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void register() async {
  if (_formKey.currentState!.validate()) {
    // Save the username and password in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);

    // Debug: Print stored credentials
    ('Stored Username: ${usernameController.text}');
    ('Stored Password: ${passwordController.text}');

    // Simulate successful registration
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Success"),
        content: const Text("Your account has been registered successfully!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  } else {
    showValidationDialog("Please correct the necessary information and try again.");
  }
}

  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Mobile Number is required";
    }
    if (!RegExp(r"^(09|\+639)\d{9}$").hasMatch(value)) {
      return "Enter a valid Philippine mobile number";
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8 ||
        !RegExp(r"[A-Z]").hasMatch(value) ||
        !RegExp(r"[a-z]").hasMatch(value) ||
        !RegExp(r"\d").hasMatch(value) ||
        !RegExp(r"[!@#\$%^&*(),.?:{}|<>]").hasMatch(value)) {
      return "Password must be at least 8 characters and include uppercase, lowercase, number, and special character.";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm Password is required";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  void clearError(String field) {
    setState(() {
      switch (field) {
        case "First Name":
          firstNameError = null;
          break;
        case "Last Name":
          lastNameError = null;
          break;
        case "Mobile Number":
          mobileError = null;
          break;
        case "Email":
          emailError = null;
          break;
        case "Password":
          passwordError = null;
          break;
        case "Confirm Password":
          confirmPasswordError = null;
          break;
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(40),
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(10),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(25)),
                Customfont(
                  text: 'Register Here',
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.bold,
                  color: FB_PURPLE_WHITE,
                ),
                SizedBox(height: ScreenUtil().setHeight(25)),

                // First Name Field
                CustomTextFormField(
                  hintText: 'First Name',
                  controller: firstNameController,
                  validator: (value) {
                    firstNameError = validateField(value, "First Name");
                    return firstNameError;
                  },
                  onTap: () => clearError("First Name"),
                ),
                if (firstNameError != null)
                  Text(firstNameError!, style: const TextStyle(color: Colors.red)),

                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                  validator: (value) {
                    lastNameError = validateField(value, "Last Name");
                    return lastNameError;
                  },
                  onTap: () => clearError("Last Name"),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  hintText: 'Mobile Number',
                  controller: mobilenumController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  validator: (value) {
                    mobileError = validateMobileNumber(value);
                    return mobileError;
                  },
                  onTap: () => clearError("Mobile Number"),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  hintText: 'Username',
                  controller: usernameController,
                  validator: (value) {
                    usernameError = validateUsername(value);
                    return usernameError;
                  },
                  onTap: () => clearError("Username"),
                ),
                if (usernameError != null)
                  Text(usernameError!, style: const TextStyle(color: Colors.red)),

                SizedBox(height: ScreenUtil().setHeight(10)),
                
                CustomTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                  validator: (value) {
                    emailError = validateField(value, "Email");
                    return emailError;
                  },
                  onTap: () => clearError("Email"),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscure: true,
                  validator: (value) {
                    passwordError = validatePassword(value);
                    return passwordError;
                  },
                  onTap: () => clearError("Password"),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  hintText: 'Confirm Password',
                  controller: confirmpasswordController,
                  isObscure: true,
                  validator: (value) {
                    confirmPasswordError = validateConfirmPassword(value);
                    return confirmPasswordError;
                  },
                  onTap: () => clearError("Confirm Password"),
                ),

                SizedBox(height: ScreenUtil().setHeight(20)),

                // Already have an account? Login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have an account? ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: ScreenUtil().setSp(10),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(context, '/login'),
                      child: Text(
                        'Login here',
                        style: TextStyle(
                          color: FB_PURPLE_WHITE,
                          fontSize: ScreenUtil().setSp(10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                // Submit Button
                CustomInkwellButton(
                  onTap: register,
                  height: ScreenUtil().setHeight(35),
                  width: ScreenUtil().screenWidth,
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.bold,
                  buttonName: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
