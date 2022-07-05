import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day49/form_widget.dart';
import 'package:ui_design_day_41_50/day49/sign_up_screen.dart';

import 'button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPass = TextEditingController();
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  radius: 25,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xff3960DC),
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.99),
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    letterSpacing: 2,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 30),
                FormWidget(
                  formKey: _key,
                  controllerEmail: _controllerEmail,
                  controllerPass: _controllerPass,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          value: _value,
                          fillColor: MaterialStateProperty.all(
                              const Color(0xff3960DC)),
                          splashRadius: 35,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "remember me",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  text: "Sign in",
                  onPressed: _login,
                  width: double.infinity,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  text: "Sign in With Google",
                  isEmpty: true,
                  onPressed: () {},
                  logo: Image.asset(
                    "assets/images/day49/google.png",
                    height: 30,
                    width: 30,
                  ),
                  width: double.infinity,
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                            text: "Sign up",
                            style: const TextStyle(
                              color: Color(0xff3960DC),
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const SigninScreen()));
                              }),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_key.currentState!.validate()) {
      debugPrint("Login Success");
    }
  }
}
