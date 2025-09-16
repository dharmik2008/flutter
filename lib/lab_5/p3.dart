import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        labelText: "email",
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter email";
                      }
                      final emailPattern =
                          RegExp(r'^[\w.-]+@[\w]+\.+[\w]{2,4}$');
                      if (!emailPattern.hasMatch(value)) {
                        return "please enter valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "enter password",
                      prefixIcon: const Icon(Icons.password),
                      labelText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter password";
                      }
                      final passwordPattern = RegExp(r'^[\w.]+$');
                      if (!passwordPattern.hasMatch(value)) {
                        return "please enter valid password";
                      }
                      if (value.length < 7) {
                        return "password must be at lease 8 letter";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Successfully login")));
                        }
                      },
                      child: const Text("Login"))
                ],
              ),
            )),
      ),
    );
  }
}
