import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp_tuto/pages/home.dart';
import 'package:shopapp_tuto/pages/login.dart';

import 'package:shopapp_tuto/db/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usersServices = UserServices();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController =
      new TextEditingController();
  final TextEditingController _passwordTextController =
      new TextEditingController();
  final TextEditingController _nameTextController = new TextEditingController();
  final TextEditingController _comfirmePasswordTextController =
      new TextEditingController();
  String gender;
  String groupValue = "male";

  bool loading = false;

  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "Images/background/man.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset(
                "Images/background/logo2.png",
              ),
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
                        padding: const EdgeInsets.only(
                            top: 180.0, left: 8, right: 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.7),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                //labelText: "Password *",
                                hintText: "Name",
                                icon: Icon(Icons.person),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              controller: _nameTextController,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "the name field cannot be empty";
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
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                //labelText: "E-mail *",
                                hintText: "Email address",
                                icon: Icon(Icons.email),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "please make sure your email address is valid";
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          color: Colors.white.withOpacity(0.4),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "Male",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.end,
                                  ),
                                  trailing: Radio(
                                      value: "male",
                                      groupValue: groupValue,
                                      onChanged: (e) {
                                        valueChanged(e);
                                      }),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "Female",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.end,
                                  ),
                                  trailing: Radio(
                                      value: "female",
                                      groupValue: groupValue,
                                      onChanged: (e) {
                                        valueChanged(e);
                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.7),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: TextFormField(
                                  decoration: InputDecoration(
                                    //labelText: "Password *",
                                    hintText: "password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return "the password field cannot be empty";
                                    else if (value.length < 6)
                                      return "The password has to be at least 6 characters long";
                                  },
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      if (hidePass == true)
                                        hidePass = false;
                                      else
                                        hidePass = true;
                                    });
                                  },
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.7),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                decoration: InputDecoration(
                                  //labelText: "Password *",
                                  hintText: "Confirm password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                controller: _comfirmePasswordTextController,
                                obscureText: hidePass,
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "the password field cannot be empty";
                                  else if (value.length < 6)
                                    return "The password has to be at least 6 characters long";
                                  else if (_passwordTextController.text !=
                                      value) return "Passwords do not match";
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    if (hidePass == true)
                                      hidePass = false;
                                    else
                                      hidePass = true;
                                  });
                                },
                              ),
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
                              padding: const EdgeInsets.only(left: 12.0),
                              child: MaterialButton(
                                onPressed: () async {
                                  validateForm();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              )),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(0.8),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new Login()));
                            },
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          )),
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
            visible: loading ?? false,
          )
        ],
      ),
    );
  }

  void valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future<void> validateForm() async {
    FormState formState = _formKey.currentState;
    Map value;
    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      print(user.uid.toString());
      if (user == null) {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((use) => {
                  _usersServices.createUser({
                    "username": _nameTextController.text,
                    "email": _emailTextController.text,
                    "userId": user.uid,
                    "gender": gender
                  })
                })
            .catchError((err) => {print("ERREUER: " + err.toString())});

        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => new HomePage()));
      }
    }
  }
}
