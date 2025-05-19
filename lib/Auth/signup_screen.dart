import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idealschool/Auth/loginscreen.dart';
import 'package:idealschool/Auth/services.dart';
import 'package:idealschool/views/homescreen.dart';

// Create an instance of AuthService
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
        Expanded(child: Divider(indent: indent, endIndent: 5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text, style: textStyle),
        ),
        Expanded(child: Divider(indent: 5, endIndent: endIndent)),
      ],
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = false;
  bool isLoading = false; // Added isLoading variable

  void signupUser() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading =
            true; // Set loading state to true when sign up process starts
      });
      try {
        if (mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        }
        Fluttertoast.showToast(
          msg: "Registered Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } on FirebaseAuthException catch (e) {
        String message = "An unexpected error occurred. Please try again.";
        if (e.code == 'weak-password') {
          message = "The password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          message = "The account already exists for that email.";
        } else {
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
              false; // Set loading state to false when sign up process ends
        });
      }
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
          Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to sign in with Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text("Register New Account",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  _buildTextFormField(
                      fullnameController, "Full Name", Icons.person),
                  _buildTextFormField(emailController, "Email", Icons.mail),
                  _buildPasswordFormField(
                      passwordController, "Password", Icons.lock),
                  const SizedBox(height: 10),
                  _buildSignUpButton(),
                  _buildLoginOption(context),
                  const SizedBox(height: 15),
                  const LabeledDivider(
                      text: "or continue with",
                      endIndent: 18,
                      indent: 18,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 16.0)),
                  const SizedBox(height: 15),
                  socialMediaIcons(),
                  isLoading
                      ? const CircularProgressIndicator()
                      : const SizedBox(), // Show loading indicator if isLoading is true
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

  Widget _buildTextFormField(
      TextEditingController controller, String hintText, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple.withOpacity(0.2)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            icon: Icon(icon), border: InputBorder.none, hintText: hintText),
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is required";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordFormField(
      TextEditingController controller, String hintText, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple.withOpacity(0.2)),
      child: TextFormField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
            icon: Icon(icon),
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: IconButton(
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                })),
        validator: (value) {
          if (value!.isEmpty) {
            return "Password is required";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurple,
      ),
      child: TextButton(
        onPressed: () {
          signupUser(); // Assuming signupUser is a method that handles the sign up logic
        },
        child: const Text("SIGN UP", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildLoginOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
              fontSize: 18,
              color: Colors.black), // Default text style for the whole line
          children: <TextSpan>[
            const TextSpan(text: "Already have an account?"), // Regular text
            TextSpan(
              text: ' Login', // The clickable text
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
                          builder: (context) => const LoginScreen(
                                controller: null,
                              )));
                },
            ),
          ],
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
