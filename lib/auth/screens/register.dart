import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/services/authentication_service.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstnameController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  bool _obscureText = true;

  String _password = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Register",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                      labelText: "Firstname",
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            Column(
              children: <Widget>[
                new TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(Icons.lock))),
                  validator: (val) =>
                      val!.length < 6 ? 'Password too short.' : null,
                  onSaved: (val) => _password = val!,
                  obscureText: _obscureText,
                ),
                new TextButton(
                    onPressed: _toggle,
                    child: new Text(_obscureText ? "Show" : "Hide"))
              ],
            ),
            TextButton(
              onPressed: () {
                context.read<AuthenticationService>().register(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      name: nameController.text.trim(),
                      firstname: firstnameController.text.trim(),
                    );
              },
              child: Text("Create an account"),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                )
              },
              child: Text("Already have an account ? login"),
            )
          ],
        ),
      ),
    );
  }
}
