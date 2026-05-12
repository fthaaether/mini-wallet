import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameControler = TextEditingController();
  final TextEditingController _fullnameControler = TextEditingController();
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();

  String _message = "";

  void _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailControler.text,
        password: _passwordControler.text,
      );
      setState(() {
        _message = "Register Berhasil";
      });
    } catch (e) {
      setState(() {
        _message = "Register Gagal! silahkan coba lagi.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini-Wallet App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameControler,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _fullnameControler,
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: _emailControler,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordControler,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text("Register")),
            // ElevatedButton(onPressed: _login, child: Text("Login")),
            SizedBox(height: 20),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
