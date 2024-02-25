import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:technovate/helper/helper_functions.dart';
import 'package:technovate/screens/authScreens/signin.dart';
import 'package:technovate/screens/authScreens/components/signup_form.dart';

import '../../Database/database_apis.dart';
import '../../constant.dart';


class SignUpScreen extends StatelessWidget {
  // It's time to validat the text field
  final _formKey = GlobalKey<FormState>();
  late String _email, _password, _userName,_phoneNumber;

  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/app_design/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            // Now it takes 100% of our height
          ),
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              )),
                          child: const Text(
                            "Sign In!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: "rohit0407",
                              label: const Text("Username"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.blue),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.red),
                              )
                          ),
                          validator: RequiredValidator(errorText: "Username is required"),
                          // Let's save our username
                          onSaved: (username) => _userName = username!,
                        ),
                        const SizedBox(height: defaultPadding),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: "test@email.com",
                              label: const Text("Email"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.blue),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.red),
                              )
                          ),
                          validator: EmailValidator(errorText: "Use a valid email!"),
                          onSaved: (email) => _email = email!,
                        ),
                        const SizedBox(height: defaultPadding),
                        // Same for phone number
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: "+123487697",
                              label: const Text("Phone Number"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.blue),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.red),
                              )
                          ),
                          validator: RequiredValidator(errorText: "Phone number is required"),
                          onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
                        ),
                        const SizedBox(height: defaultPadding),


                        TextFormField(
                          // We want to hide our password
                          obscureText: true,
                          decoration: InputDecoration(hintText: "******",
                              label: const Text("Password"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.blue),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.red),
                              )
                          ),
                          validator: passwordValidator,
                          onSaved: (password) => _password = password!,
                          // We also need to validate our password
                          // Now if we type anything it adds that to our password
                          onChanged: (pass) => _password = pass,
                        ),
                        const SizedBox(height: defaultPadding),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: "*****",
                              label: const Text("Confirm Password"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.blue),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Colors.red),
                              )
                          ),
                          validator: (pass) => MatchValidator(errorText: "Password do not match").validateMatch(pass!,_password!=null?_password:""),
                        ),
                      ],
                    ),
                  ),
                    const SizedBox(height: defaultPadding * 2),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2D5ED0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                            )
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Sign up form is done
                            // It saved our inputs
                            _formKey.currentState!.save();
                            Helpers.showProgressBar(context);
                            DatabaseApis.createUser(_email.trim().toString(),_userName.trim().toString(),_password.trim().toString(),_phoneNumber.trim().toString(),context);
                          }
                        },
                        child: const Text("Sign Up", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}