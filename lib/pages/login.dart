
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_tuto/pages/signup.dart';
import 'home.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp_tuto/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn(
    scopes:[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = new TextEditingController();
  final TextEditingController _passwordTextController = new TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if(isLogedin){
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSign() async{
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await firebaseAuth.signInWithCredential(credential)).user;

      if (user != null)
      {
        final QuerySnapshot result = await Firestore.instance.collection("users")
            .where("id", isEqualTo: user.uid)
            .getDocuments();
        final List<DocumentSnapshot> documents = result.documents;

        if(documents.length==0){
          // insert the user in the collection
          Firestore.instance
              .collection("users")
              .document(user.uid)
              .setData({
            "id": user.uid,
            "username": user.displayName,
            "profilPicture": user.photoUrl
          });

          await preferences.setString("id", user.uid);
          await preferences.setString("username", user.displayName);
          await preferences.setString("phofilPicture", user.displayName);
        } else {
          await preferences.setString("id", documents[0]['id']);
          await preferences.setString("username", documents[0]['username']);
          await preferences.setString("photoUrl", documents[0]['photoUrl']);
        }

        Fluttertoast.showToast(msg: "Login was successful");
        setState(() {
          loading = false;
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> new HomePage()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "Images/background/woman.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Image.asset("Images/background/logo2.png",),
            ),
          ),
          Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:200.0, left: 8, right: 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //labelText: "E-mail *",
                                  hintText: "Email address",
                                  icon: Icon(Icons.email),
                                  //border: OutlineInputBorder(),

                                ),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                validator: (value){
                                  if(value.isEmpty)
                                    return "please make sure your email address is valid";
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //labelText: "Password *",
                                  hintText: "password",
                                  icon: Icon(Icons.lock_outline),
                                 // border: OutlineInputBorder(),

                                ),
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordTextController,
                                validator: (value){
                                  if(value.isEmpty)
                                    return "the password field cannot be empty";
                                  else if (value.length < 6)
                                    return "The password has to be at least 6 characters long";
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child:MaterialButton(
                                onPressed: (){},
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> new SignUp()));
                            },
                            child: Text("sign up", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
                          )
                        ),
//                    RichText(
//                      text: TextSpan(
//                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
//                        children: [
//                          TextSpan(text: "Don't have account ? click here to "),
//                          TextSpan(
//                              text: "sign up!",
//                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)
//                          ),
//                        ]
//                      ),
//                    ),
                        Divider(color: Colors.white,),
                        Text("Other login in options", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red,
                            child: Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child:MaterialButton(
                                  onPressed: (){handleSign();},
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Google",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
          Visibility(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
            visible: loading??false,)
        ],
      ),

    );
  }


}

