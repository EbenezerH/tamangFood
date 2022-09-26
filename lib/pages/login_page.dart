import 'package:flutter/material.dart';
import 'package:tamang_foodservice/pages/welcome_page/welcome_page.dart';
import 'package:tamang_foodservice/widgets/responsive_button.dart';
import '../../constants/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Sign In", style: TextStyle(
          color: Colors.black)
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.70,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Welcome to Tamang Food Services", 
                          style: TextStyle(
                            fontSize: 33,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 280,
                          child: Text(
                            "Enter your Phone number or Email address for sign in. Enjoy your food :)", 
                            style: TextStyle(
                              fontSize: 16, color: AppColors.textColor2
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            iconColor: Colors.green,
                            labelText: 'EMAIL ADDRESS',
                            hintText: "tamangfigma@gmail.com",
                            enabled: true,
                            contentPadding: EdgeInsets.only(
                                left: 0, bottom: 8.0, top: 8.0),
                            /*focusedBorder: OutlineInputBorder(
                              borderSide: const  BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),*/
                          ),
                          validator: (value) {
                            // ignore: prefer_is_empty
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 0, bottom: 8.0, top: 15.0),
                            /*focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),*/
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 20),

                        const SizedBox(width: double.maxFinite, child: Text(textAlign: TextAlign.center,"Forget Password", style: TextStyle(color: AppColors.textColor2),)),

                        const SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              visible = true;
                            });
                            debugPrint("Sign in ok");
                            signIn(emailController.text, passwordController.text);
                          },
                          child: const ResponsiveButton(width: double.maxFinite, text: "SIGN IN"),
                        ),
                        const SizedBox(height: 10,),

                        Row(
                          children: const[
                            SizedBox(width: double.maxFinite, child: Text(
                              textAlign: TextAlign.left,
                              "Don't have account?",
                              style: TextStyle(color: Colors.blue),
                              )
                            ),SizedBox(width: double.maxFinite - 20, child: Text(
                              textAlign: TextAlign.left,
                              "Create a new account?", 
                              style: TextStyle(color: Colors.red),
                              )
                            ),
                          ]
                        ),

                        Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),/*
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      elevation: 5.0,
                      height: 40,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const WelcomePage();
                              //Register();
                            },
                          ),
                        );
                      },
                      color: Colors.blue[900],
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),*/
                    SizedBox(
                      height: 15,
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
  
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      String validEmail = "tamangmail@gmail.com";
      String validPassword = "tam#1.g";

        if(email != validEmail){
          debugPrint('No user found for that email.');
        }else if(password != validPassword){
          debugPrint('Wrong password provided for that user.');
        }else if(email == validEmail && password == validPassword){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
          );
        }
    }
  }

}

