import 'package:flutter/material.dart';
import 'package:online_chat_app/services/auth/auth_service.dart';
import 'package:online_chat_app/components/my_button.dart';
import 'package:online_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmaiPassword(
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
              "Welcome back, you've been missed",
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
              height: 25,
            ),
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
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
