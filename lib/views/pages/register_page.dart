import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms/views/widgets/snackbar_widget.dart';
import '../../model/constant.dart';
import '../widgets/textfeild_border.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool conformSeen = true;
  bool seen = true;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  Future logIn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException {
      showSnackBar(context, "Email is already exist");
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                appName,
                style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 2,
                    fontSize: 40,
                    fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty || value.contains(" ")) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                      ),
                      onPressed: () {
                        emailController.clear();
                      },
                    ),
                    hintText: "Email",
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: seen,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.contains(" ")) {
                      return "Enter valid email";
                    } else if (value != conformPasswordController.text) {
                      return "Enter same password";
                    } else if (value.length < 8) {
                      return "Password length must be more than 7";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        seen ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        if (seen) {
                          seen = false;
                        } else {
                          seen = true;
                        }
                        setState(() {});
                      },
                    ),
                    hintText: "Password",
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: conformSeen,
                  controller: conformPasswordController,
                  validator: (value) {
                    if (value!.isEmpty || value.contains(" ")) {
                      return "Enter valid email";
                    } else if (value != passwordController.text) {
                      return "Enter same password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        conformSeen ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        if (conformSeen) {
                          conformSeen = false;
                        } else {
                          conformSeen = true;
                        }
                        setState(() {});
                      },
                    ),
                    hintText: "Conform Password",
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      logIn();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Sigh In",
                        style: TextStyle(
                            color: Colors.grey[50],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have an account ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
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
}
