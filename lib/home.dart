import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logfire/user_model.dart';

import 'login.dart';

class Home extends StatefulWidget {
  // const Home({Key? key, this.image, this.name, this.email}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  // final image;
  // final name;
  // final email;
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        // backgroundColor: Colors.deepOrange,
        child: ListView(
          children: [
        // children: [
        // Image.network(widget.image, height: 200, width: 200,),
        //   Text(widget.name),
        //   Text(widget.email),
        //   SizedBox(height: 100),
            UserAccountsDrawerHeader(accountName: Text("${loggedInUser.firstName} ${loggedInUser.secondName}",),
                                     accountEmail: Text("${loggedInUser.email}",),
                currentAccountPicture: const CircleAvatar(backgroundColor: Colors.black26,child:Icon(Icons.person),),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              )
              ),

      //       ListTile(
      //         title:Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
      //           style: TextStyle(
      //             color: Colors.black54,
      //             fontWeight: FontWeight.w500,
      //
      //           )
      //         ),
      //       ),
      //   ListTile(
      //    title: Text("${loggedInUser.email}",
      //         style: TextStyle(
      //           color: Colors.black54,
      //           fontWeight: FontWeight.w500,
      //         )
      //     ),
      //   ),
      //       ListTile(
      //         title:ActionChip(
      //             label: Text("Logout"),
      //             onPressed: () {
      //               logout(context);
      //             }),
      //       )
        ]
      ),
      ),
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade700,


      ),
      body: Center(

                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      // ActionChip(
                      //     label: Text("Logout"),
                      //     onPressed: () {
                      //       logout(context);
                      //     }),
                   ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut().then((value) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ));
                        });
                        await GoogleSignIn().signOut();
                      },
                      child: Text('logout')),

                    ],
                  ),
                ),
              ),
      );

  }

  // the logout function
//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => Login()));
//   }
}
