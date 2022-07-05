import 'package:flutter/material.dart';

import 'text_form_widget.dart';

class FormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  const FormWidget(
      {required this.formKey,
      required this.controllerEmail,
      required this.controllerPass,
      Key? key})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool validVlid = false;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormWidget(
              controller: widget.controllerEmail,
              text: "Your Email",
              hint: "Email",
              keyboardType: TextInputType.emailAddress,
              suffixIcon: validVlid
                  ? const Icon(
                      Icons.check_rounded,
                      color: Color(0xff3960DC),
                      size: 40,
                    )
                  : null,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your Email");
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                setState(() {
                  validVlid = true;
                });
                return null;
              },
              onChanged: (String? value) {
                if (value!.isEmpty) {
                  return;
                }
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  setState(() {
                    validVlid = true;
                  });
                } else {
                  if (validVlid) {
                    setState(() {
                      validVlid = false;
                    });
                  }
                }
              }),
          TextFormWidget(
            controller: widget.controllerPass,
            text: "Password",
            hint: "password",
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              RegExp regex = RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid Password(Min. 6 Character)");
              }
              return null;
            },
            obscureText: _obscureText,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: const Color(0xff3960DC),
                  size: 40,
                )),
          ),
        ],
      ),
    );
  }
}
