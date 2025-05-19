import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idealschool/Auth/forget.dart';
import 'package:idealschool/Auth/services.dart';
import 'package:idealschool/Auth/signup_screen.dart';
import 'package:idealschool/views/homescreen.dart';

AuthService authService = AuthService();

class LabeledDivider extends StatelessWidget {
  final String text;
  final double indent;
  final double endIndent;
  final TextStyle? textStyle;

  const LabeledDivider({
    super.key,
    required this.text,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(indent: indent, endIndent: 5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text, style: textStyle),
        ),
        Expanded(
          child: Divider(indent: 5, endIndent: endIndent),
        ),
      ],
    );
  }
}

//

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required controller});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  bool isLoginTrue = false;
  bool isLoading = false; // Added isLoading variable
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final FirebaseAuth _firebaseAuth =
      FirebaseAuth.instance; // Declare FirebaseAuth instance
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(); // Declare GoogleSignIn instance

  String? errorMessage;

  //
  void loginUser() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true; // Set loading state to true when login process starts
      });
      try {
        User? user = await _authService.signInWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        if (user != null) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
          Fluttertoast.showToast(
            msg: "Login Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } on FirebaseAuthException catch (e) {
        if (!mounted) return;

        String message = "An unexpected error occurred. Please try again.";
        switch (e.code) {
          case 'user-not-found':
            message = "No account found with that email. Please register.";
            break;
          case 'wrong-password':
            message = "Incorrect password. Click 'Forgot Password' to reset.";
            break;
          case 'too-many-requests':
            message = "Too many requests. Please try again later.";
            break;
          default:
            message = "Error: ${e.message}";
        }

        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e) {
        if (!mounted) return;

        Fluttertoast.showToast(
          msg: "An Network Issue. Please try again.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } finally {
        setState(() {
          isLoading =
              false; // Set loading state to false when login process ends
        });
      }
    }
  }

  //

//

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          Fluttertoast.showToast(msg: 'Sign in successful: ${user.email}');
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to sign in with Google: $e');
    }
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset("assets/ic_launcher.png", width: 150),
                  const SizedBox(height: 20),
                  textFormFieldWidget(emailController, "Email", Icons.email),
                  passwordFormField(),
                  const SizedBox(height: 10),
                  loginButton(context),

                  forgotPasswordButton(
                      context), // Adding the forgot password button here
                  const LabeledDivider(
                    text: "or continue with",
                    endIndent: 18,
                    indent: 18,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 15),
                  socialMediaIcons(),
                  const SizedBox(height: 5), // Include social media icons here
                  signUpOption(context),
                  isLoading
                      ? const CircularProgressIndicator()
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget socialMediaIcons() {
    return Wrap(
      spacing: 4,
      alignment: WrapAlignment.end,
      children: [
        buildSocialButton(
          onTap: () {
            signInWithGoogle();
          },
          buttonType: ButtonType.google,
          iconColor: Colors.white,
        ),
        // Add more buttons if needed
      ],
    );
  }

  Widget buildSocialButton({
    required void Function() onTap,
    required ButtonType buttonType,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: FlutterSocialButton(
        onTap: onTap,
        buttonType: buttonType,
        mini: true,
        iconColor:
            iconColor ?? Colors.black, // Use default color if iconColor is null
      ),
    );
  }

//
  Widget forgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          // Navigate to the ForgotPassword screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgotPassword()),
          );
          if (kDebugMode) {
            print('Forgot Password pressed');
          }
        },
        child: const Text('Forgot Password?',
            style: TextStyle(color: Colors.deepPurple)),
      ),
    );
  }

//
  Widget signUpOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 18, color: Colors.black), // Default text style
                  children: <TextSpan>[
                    const TextSpan(text: "Don't have an account?"),
                    TextSpan(
                      text: ' Sign up',
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
          isLoginTrue
              ? const Text(
                  'User name and Password is Incorrect',
                  style: TextStyle(color: Colors.red),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  //

  Widget textFormFieldWidget(
      TextEditingController controller, String hintText, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurple.withOpacity(0.2),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is required";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(icon),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  Widget passwordFormField() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurple.withOpacity(0.2),
      ),
      child: TextFormField(
        controller: passwordController,
        obscureText: !isVisible,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password is required";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.lock),
          border: InputBorder.none,
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurple,
      ),
      child: TextButton(
        onPressed: () {
          if (kDebugMode) {
            print("Attempting to login");
          } // Debug statement
          if (formKey.currentState!.validate()) {
            loginUser(); // Call loginUser method on button press if form is valid
          }
        },
        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
//