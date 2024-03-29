import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/view_models/user_view_model.dart';
import '../data_resources/user/user_api_service.dart';
import '../resources/auth.dart';
import 'page_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginBody());
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late User user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void pressed() {
    signInWithGoogle().then((user) async {
      this.user = user;
      String googleToken = await user.getIdToken();
      print('Token: ${googleToken}');
      await Provider.of<UserViewModel>(context, listen: false)
          .getValidateUser(googleToken);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (content) => HomePage(user: user)));
    });
  }

  Widget googleLoginButton() {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: pressed,
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
            foregroundColor: Colors.grey,
            side: const BorderSide(color: Colors.grey),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/GoogleLogo.png'),
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Continue with Google",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 100, bottom: 40),
            child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome!",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                    Text("Login to your account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45)),
                      hintText: "Input your phone number")),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: OutlinedButton(
                onPressed: pressed,
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    foregroundColor: Colors.grey,
                    backgroundColor: Color.fromRGBO(234, 152, 91, 1),
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
                child: const Text("Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ),
          ),
          const Text(
            "Or",
            style: TextStyle(fontSize: 30, color: Color(0x6A798AFF)),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child:
                Align(alignment: Alignment.center, child: googleLoginButton()),
          )
        ],
      ),
    );
  }
}
