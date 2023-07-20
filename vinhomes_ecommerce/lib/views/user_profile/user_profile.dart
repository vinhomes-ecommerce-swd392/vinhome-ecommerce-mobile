import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhomes_ecommerce/view_models/user_view_model.dart';

import '../../main.dart';
import '../../models/user.dart';
import '../../resources/auth.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  onSignOut() async {
    signOutGoogle();
    Provider.of<UserViewModel>(context, listen: false).user = null;
    Provider.of<UserViewModel>(context, listen: false).token = null;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("jwtToken", "");
    prefs.setString("userInfo", "");

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (content) => MainApp()));
  }

  @override
  Widget build(BuildContext context) {
    final userOnProvider = Provider.of<UserViewModel>(context);

    User? userInfo = userOnProvider.user;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/food.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          userInfo != null
              ? Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(userInfo.photoUrl!),
                        radius: 64,
                      ),
                      Container(
                          width: double.maxFinite,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userInfo.name,
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold)),
                              Text(userInfo.email,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal)),
                            ],
                          )),
                      SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () {},
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
                            Icon(Icons.edit),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Chỉnh sửa thông tin",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          onSignOut();
                        },
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
                            Icon(Icons.logout),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Đăng xuất",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 500,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
    ));
  }
}
