import 'package:flutter/material.dart';
import 'package:online_chat_app/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});
  void register(BuildContext context) {
    //Get auth service
    final _auth = AuthService();
    // if passwords match -> create user
    if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailcontroller.text,
          _passwordcontroller.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // passwords don't match  -> show error to user
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('password dont match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            MyTextField(
              hintText: 'Email',
              obsecureText: false,
              controller: _emailcontroller,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Password',
              obsecureText: true,
              controller: _passwordcontroller,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              obsecureText: true,
              controller: _confirmpasswordcontroller,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an acoount? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
