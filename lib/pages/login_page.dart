import 'package:flutter/material.dart';
import 'package:tamang_foodservice/test.dart';
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
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Sign In", style: TextStyle(
          color: Colors.black)
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Welcome to $tamang $foodservice",
                style: TextStyle(
                  fontSize: 33,
                ),
              ),

              const SizedBox(height: 10,),

              const SizedBox(
                //width: width1 <= 650 ? 280 : double.maxFinite ,
                child: Text(
                  "Enter your Phone number or Email address for sign in. Enjoy your food :)",
                  style: TextStyle(
                      fontSize: 16, color: AppColors.textColor2
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            left: 0, bottom: 8.0, top: 8.0
                        ),
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

                    const SizedBox(height: 20,),

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
                            left: 0, bottom: 8.0, top: 15.0
                        ),
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

                    Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: visible,
                        child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )
                        )
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    textAlign: TextAlign.center,"Forget Password?",
                    style: TextStyle(
                        color: AppColors.textColor2
                    ),
                  )
              ),

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    SizedBox(
                        child: Text(
                          textAlign: TextAlign.left,
                          "Don't have account?",
                          style: TextStyle(color: Colors.blue),
                        )
                    ),

                    SizedBox(width: 20,),

                    SizedBox(
                        child: Text(
                          textAlign: TextAlign.left,
                          "Create a new account?",
                          style: TextStyle(color: Colors.red),
                        )
                    ),
                  ]
              ),

              const SizedBox(height: 20,),

              const SizedBox(
                  width: double.maxFinite,
                  child: Text("Or", textAlign: TextAlign.center,)
              ),

              const SizedBox(height: 20),

              Container(
                width: double.maxFinite,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff395998),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    Image.asset("assets/clip_art/facebook.png"),

                    const SizedBox(width: 50),

                    const Text("CONNECT WITH FACEBOOK",
                      style: TextStyle(
                        color: AppColors.textButtonColor,
                        fontSize: 15,),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.maxFinite,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff4285F4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    Image.asset("assets/clip_art/google.png"),

                    const SizedBox(width: 50),

                    const Text("CONNECT WITH GOOGLE",
                      style: TextStyle(
                        color: AppColors.textButtonColor,
                        fontSize: 15,),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
              builder: (context) => const Test(),
            ),
          );
        }
    }
  }

}

