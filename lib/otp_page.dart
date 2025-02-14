
import 'package:document_management_main/apis/ikon_service.dart';
import 'package:flutter/material.dart';
import '../components/custom_input.dart';
import 'package:document_management_main/apis/auth_service.dart';
import '../document_management_entry_point.dart';

import '../apis/auth_service.dart';
import '../apis/dart_http.dart';
import 'package:document_management_main/apis/ikon_service.dart';

class OtpPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final AuthService _authService = AuthService();


  void _loginWithOtp(BuildContext context, String otp) async {
    bool isSuccess = await IKonService.iKonService.validateOtp(otp);
    if (isSuccess) {
      // Navigate to the home page or dashboard
      // Navigator.pushNamed(context, '/home');


      // Step 3: Handle the response (e.g., display data)
      // print('API Response: $response');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data fetched successfully!')),
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (
      //         context) => TestViewer(),
      //   ),
      // );  //for navigating after otp
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username & password.Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ensure the Scaffold resizes when the keyboard appears
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        // Detect taps outside of input fields
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // Full Background Image
            SizedBox.expand(
              child: Image.asset(
                'assets/loginPageBackgroundImage.gif', // Background image
                fit: BoxFit.cover,
              ),
            ),

            // Main Content with Scroll and SafeArea
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // KEROSS Logo and Language Selector
                    Image.asset(
                      'assets/keross-logo.png', // Replace with your logo image
                      height: 40,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.flag, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'EN',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Heading
                    const Text(
                      'Transforming complexity\ninto opportunity with AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    // Centered Content
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // IKON Logo
                              Image.asset(
                                'assets/ikon-logo.png',
                                height: 40,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Harness the Power of Data',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Username Input
                              CustomInput(
                                labelText: 'Otp',
                                hintText: 'Enter your otp',
                                isMandatory: true,
                                prefixIcon: const Icon(Icons.person_outline),
                                controller: otpController,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter Otp';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(height: 20),

                              // Forgot Password
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Resend otp',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF407BFF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // if (usernameController.text == 'user1' &&
                                      //     passwordController.text == 'user1') {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (
                                      //           context) => const OtpPage(),
                                      //     ),
                                      //   );
                                      // } else {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(
                                      //     const SnackBar(
                                      //       content: Text(
                                      //           'Invalid username or password'),
                                      //     ),
                                      //   );
                                      // }

                                      _loginWithOtp(context,otpController.text);

                                    }
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Reset Button
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Footer Links and Logo
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Don't have any account?",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          'Looking for Support?',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Version 6.5.2',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Powered By ',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                            Image.asset(
                              'assets/keross-footer.png',
                              height: 16,
                            ),
                            const Text(
                              ' | © 2025',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10), // Add spacing
                            const Icon(
                              Icons.menu, // Hamburger icon
                              color: Colors.white54,
                              // Match the color with the other text
                              size: 30, // Adjust size as needed
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}