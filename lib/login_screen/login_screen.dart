import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathoncalorie/gender_page/gender_page.dart';
import 'package:hackathoncalorie/purpose/purpose.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathoncalorie/Database.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<LoginPage> {
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String email;
  String password;
  String name;
  bool isLogin = false;

  Widget _showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text('Authentication Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(errorMessage),
                ],
              ),
            ),
            actions: <Widget>[
              PlatformDialogAction(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              PlatformDialogAction(
                child: Text('Ok'),
                actionType: ActionType.Preferred,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget _showSuccessDialog(String successMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text('Authentication Successful'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(successMessage),
                ],
              ),
            ),
            actions: <Widget>[
              PlatformDialogAction(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    Navigator.pop(context); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double loginLeftValue = MediaQuery.of(context).size.width * 0.30;
    double registeredLeftValue = MediaQuery.of(context).size.width * 0.29;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFFe3fdfd),
                  Color(0xFFcbf1f5),
                  Color(0xFFa6e3e9),
                  Color(0xFF71c9ce),
                ])), //Color(0xFFDFF8FE)),
            child: Stack(
              children: [
//                Text(
//                  errorMessage,
//                  style: TextStyle(
//                    color: Colors.red,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: 330,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Dieten",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Jost',
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF12947f)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Stack(
                          children: [
                            // LOGIN
                            isLogin
                                ? Positioned(
                                    top: 15,
                                    left: 20,
                                    right: 20,
                                    child: Container(
                                      height: 460,
                                      width: MediaQuery.of(context).size.width *
                                          0.98,
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: ClipPath(
                                              clipper: SignupClipper(),
                                              child: Container(
                                                height: 500,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.92,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[400]
                                                        .withOpacity(0.2)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30,
                                                          top: 12,
                                                          right: 30),
                                                      child: Text(
                                                        "Sign Up",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 27,
                                                                color: Colors
                                                                    .grey[400]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          CustomPaint(
                                            painter: loginShadowPaint(),
                                            child: ClipPath(
                                              clipper: loginClipper(),
                                              child: Container(
                                                height: 500,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.92,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF30e3ca)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30, top: 20),
                                                      child: Text(
                                                        "Login",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 32,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                        width: 75,
                                                        margin: EdgeInsets.only(
                                                          left: 30,
                                                        ),
                                                        height: 12,
                                                        child: Card(
                                                            elevation: 2,
                                                            color:
                                                                Colors.white)),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                        margin: EdgeInsets.only(
                                                          left: 30,
                                                        ),
                                                        height: 60,
                                                        child: TextField(
                                                          onChanged: (value) {
                                                            email = value;
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          decoration:
                                                              InputDecoration(
                                                                  icon: Icon(
                                                                    Icons.mail,
                                                                    size: 24,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  hintText:
                                                                      "Email",
                                                                  labelStyle: GoogleFonts.lato(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white)),
                                                        )),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                        margin: EdgeInsets.only(
                                                          left: 30,
                                                        ),
                                                        height: 60,
                                                        child: TextField(
                                                          onChanged: (value) {
                                                            password = value;
                                                          },
                                                          obscureText: true,
                                                          decoration:
                                                              InputDecoration(
                                                                  icon: Icon(
                                                                    Icons.build,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  hintText:
                                                                      "Password",
                                                                  labelStyle: GoogleFonts.lato(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white)),
                                                        )),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 28),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Spacer(),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              showSpinner =
                                                                  true;
                                                              try {
                                                                final Passlink =
                                                                    await _auth
                                                                        .sendPasswordResetEmail(
                                                                            email:
                                                                                email);
                                                                if (email !=
                                                                    null) {
                                                                  setState(() {
                                                                    _showSuccessDialog(
                                                                        "Please check your inbox");
                                                                    showSpinner =
                                                                        false;
                                                                  });
                                                                }
                                                              } catch (e) {
                                                                setState(() {
                                                                  _showErrorDialog(
                                                                      'Please enter your email');
                                                                  showSpinner =
                                                                      false;
                                                                });
                                                              }
                                                            },
                                                            child: Text(
                                                              "Forgot Password ?",
                                                              style: GoogleFonts.roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.266,
                                            bottom: 80,
                                            child: Align(
                                              alignment: Alignment(0, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 120,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              spreadRadius: 1,
                                                              blurRadius: 0)
                                                        ]),
                                                    child: MaterialButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          showSpinner = true;
                                                        });

                                                        try {
                                                          final newUser = await _auth
                                                              .signInWithEmailAndPassword(
                                                                  email: email,
                                                                  password:
                                                                      password);


                                                          if (newUser != null) {
                                                            Navigator.push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      GenderPage(),
                                                                ));
                                                            setState(() {
                                                              showSpinner =
                                                                  false;
                                                            });
                                                          }
                                                        } catch (e) {
                                                          print(e);

                                                          setState(() {
                                                            _showErrorDialog(
                                                                'Please make sure that the email and password entered are correct');
                                                            showSpinner = false;
                                                          });
                                                        }
                                                      },
                                                      elevation: 2,
                                                      child: Text(
                                                        "Login",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13.5,
                                                                color: Color(
                                                                    0xFF4BB8F4)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                : Container(),
                            // SIGN-UP
                            isLogin == false
                                ? Positioned(
                                    top: 20,
                                    left: 20,
                                    right: 20,
                                    child: Container(
                                      height: 455,
                                      width: MediaQuery.of(context).size.width *
                                          0.98,
//                                  margin: EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          CustomPaint(
                                            painter: signupShadowPaint(),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: ClipPath(
                                                    clipper: loginClipper(),
                                                    child: Container(
                                                      height: 500,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.92,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey[400]
                                                              .withOpacity(
                                                                  0.2)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    top: 20,
                                                                    right: 30),
                                                            child: Text(
                                                              "Login",
                                                              style: GoogleFonts.roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 27,
                                                                  color: Colors
                                                                          .grey[
                                                                      400]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ClipPath(
                                                  clipper: SignupClipper(),
                                                  child: Container(
                                                    height: 500,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.92,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF30e3ca)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Spacer(),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 30,
                                                                      top: 20,
                                                                      right:
                                                                          20),
                                                              child: Text(
                                                                "Sign Up",
                                                                style: GoogleFonts.roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        32,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Spacer(),
                                                            Container(
                                                                width: 85,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            30,
                                                                        right:
                                                                            25),
                                                                height: 12,
                                                                child: Card(
                                                                    elevation:
                                                                        2,
                                                                    color: Colors
                                                                        .white)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 30,
                                                            ),
                                                            height: 60,
                                                            child: TextField(
                                                              onChanged:
                                                                  (value) {
                                                                name = value;
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .perm_identity,
                                                                        size:
                                                                            24,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      hintText:
                                                                          "Name",
                                                                      labelStyle: GoogleFonts.lato(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white)),
                                                            )),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 30,
                                                            ),
                                                            height: 60,
                                                            child: TextField(
                                                              onChanged:
                                                                  (value) {
                                                                email = value;
                                                              },
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              decoration:
                                                                  InputDecoration(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .mail,
                                                                        size:
                                                                            20,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      hintText:
                                                                          "Email",
                                                                      labelStyle: GoogleFonts.lato(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white)),
                                                            )),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 30,
                                                            ),
                                                            height: 60,
                                                            child: TextField(
                                                              onChanged:
                                                                  (value) {
                                                                password =
                                                                    value;
                                                              },
                                                              obscureText: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .build,
                                                                        size:
                                                                            20,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      hintText:
                                                                          "Password",
                                                                      labelStyle: GoogleFonts.lato(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white)),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.29,
                                            bottom: 75,
                                            child: Align(
                                              alignment: Alignment(0, 40),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                  ),
                                                  Container(
                                                    width: 120,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color(
                                                                  0xFF4BB8F4),
                                                              spreadRadius: 0.1,
                                                              blurRadius: 1)
                                                        ]),
                                                    child: MaterialButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          showSpinner = true;
                                                        });
                                                        print(name);
//                                                      print(Email);
//                                                      print(Password);
//                                                        _firestore.collection('Profile-info').add({
//                                                          'Name': name
//                                                        });
                                                        try {
                                                          final newUser = await _auth
                                                              .createUserWithEmailAndPassword(
                                                                  email: email,
                                                                  password:
                                                                      password);

                                                          FirebaseUser user = newUser.user;
                                                          var userUpdateInfo = UserUpdateInfo();
                                                          userUpdateInfo.displayName = name;
                                                          await user.updateProfile(userUpdateInfo);

                                                          if (newUser != null) {
                                                            setState(() {
                                                              _showSuccessDialog(
                                                                  "Registration Successful, you can log in now");
                                                              isLogin = false;
                                                              showSpinner =
                                                                  false;
                                                            });
                                                          }
                                                        } catch (e) {
                                                          setState(() {
                                                            _showErrorDialog(
                                                                'Could not register. Please make sure the email is not taken and is in the correct format ');

                                                            showSpinner = false;
                                                          });
                                                        }
                                                      },
                                                      elevation: 2,
                                                      child: Text(
                                                        "Sign Up",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13.5,
                                                                color: Color(
                                                                    0xFF4BB8F4)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                : Container(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.035,
                  right: MediaQuery.of(context).size.width * 0.315,
                  child: Icon(
                    FontAwesomeIcons.cog,
                    color: Color(0xFF12947f),
                    size: 18,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  right: MediaQuery.of(context).size.width * 0.2,
                  child: Icon(
                    FontAwesomeIcons.cog,
                    color: Color(0xFF12947f),
                    size: 12,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.22,
                  child: Icon(
                    LineIcons.close,
                    color: Color(0xFF12947f),
                    size: 24,
                  ),
                ),
                isLogin
                    ? Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.11,
                        left: loginLeftValue,
                        child: GestureDetector(
                          onTap: () {
                            if (isLogin) {
                              setState(() {
                                isLogin = false;
                              });
                            } else {
                              setState(() {
                                isLogin = true;
                              });
                            }
                          },
                          child: Text(
                            isLogin
                                ? " New User? Sign Up"
                                : "Registered User? Login",
                            style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.11,
                        left: registeredLeftValue,
                        child: GestureDetector(
                          onTap: () {
                            if (isLogin) {
                              setState(() {
                                isLogin = false;
                              });
                            } else {
                              setState(() {
                                isLogin = true;
                              });
                            }
                          },
                          child: Text(
                            isLogin
                                ? " New User? Sign Up"
                                : "Registered User? Login",
                            style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class loginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clip = new Path();

    clip.moveTo(0, 70);
    clip.lineTo(0, size.height - 70);
    clip.quadraticBezierTo(0, size.height, 70, size.height);

    clip.lineTo(size.width - 70, size.height);
    clip.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 70);

    clip.lineTo(size.width, size.height * 0.3 + 50);
    clip.quadraticBezierTo(
        size.width, size.height * 0.3, size.width - 50, size.height * 0.3 - 50);

    clip.lineTo(70, 0);
    clip.quadraticBezierTo(0, 0, 0, 70);
    clip.close();
    return clip;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SignupClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clip = new Path();
    clip.moveTo(size.width, 70);
    clip.lineTo(size.width, size.height - 70);
    clip.quadraticBezierTo(
        size.width, size.height, size.width - 70, size.height);

    clip.lineTo(70, size.height);
    clip.quadraticBezierTo(0, size.height, 0, size.height - 70);

    clip.lineTo(0, size.height * 0.3 + 50);
    clip.quadraticBezierTo(0, size.height * 0.3, 50, size.height * 0.3 - 50);
    clip.lineTo(size.width - 70, 0);

    clip.quadraticBezierTo(size.width, 0, size.width, 70);

    clip.close();
    return clip;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class loginShadowPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path clip = new Path();

    clip.moveTo(0, 70);
    clip.lineTo(0, size.height - 70);
    clip.quadraticBezierTo(0, size.height, 70, size.height);

    clip.lineTo(size.width - 70, size.height);
    clip.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 70);

    clip.lineTo(size.width, size.height * 0.3 + 50);
    clip.quadraticBezierTo(
        size.width, size.height * 0.3, size.width - 50, size.height * 0.3 - 50);

    clip.lineTo(70, 0);
    clip.quadraticBezierTo(0, 0, 0, 70);
    clip.close();

    canvas.drawShadow(clip, Color(0xFF4BB8F4), 5, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class signupShadowPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path clip = new Path();
    clip.moveTo(size.width, 70);
    clip.lineTo(size.width, size.height - 70);
    clip.quadraticBezierTo(
        size.width, size.height, size.width - 70, size.height);

    clip.lineTo(70, size.height);
    clip.quadraticBezierTo(0, size.height, 0, size.height - 70);

    clip.lineTo(0, size.height * 0.3 + 50);
    clip.quadraticBezierTo(0, size.height * 0.3, 50, size.height * 0.3 - 50);
    clip.lineTo(size.width - 70, 0);

    clip.quadraticBezierTo(size.width, 0, size.width, 70);

    clip.close();

    canvas.drawShadow(clip, Color(0xFF4BB8F4), 5, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
