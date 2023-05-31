import 'package:flutter/material.dart';

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
  void pressed() {
    // signInWithGoogle().then((user) => {
    //       this.user = user,
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (content) => MyHomePage(user)))
    //     });
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
              child: Text("Continue with Google Account",
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
            margin: const EdgeInsets.only(top: 100, bottom: 40),
            child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
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
            child: SizedBox(
              child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45)),
                      labelText: "Input your phone number")),
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
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Confirm",
                        style: TextStyle(color: Colors.grey, fontSize: 16))
                  ],
                ),
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
