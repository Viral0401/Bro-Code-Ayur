import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:technovate/Database/database_apis.dart';
import 'package:technovate/constant.dart';
import 'package:technovate/helper/helper_functions.dart';
import 'package:technovate/screens/authScreens/components/signin_form.dart';
import 'package:technovate/screens/authScreens/signup.dart';


class SignInScreen extends StatefulWidget {

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
    return SafeArea(
      child: Scaffold(
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
            Padding(
              padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            ),
                            child: const Text(
                              "Sign Up!",
                              style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF2D5ED0) ),
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
                          ),
                          const SizedBox(height: defaultPadding),
                        ],
                      ),
                    ),
                      const SizedBox(height:defaultPadding * 2),
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
                              DatabaseApis.loginUser(_email, _password, context);

                              //  Sign in also done
                            }
                          },
                          child: const Text("Sign In", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}