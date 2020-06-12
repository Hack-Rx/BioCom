import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

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
  bool islogin = true;

  @override
  Widget build(BuildContext context) {
    double loginLeftValue = MediaQuery.of(context).size.width * 0.30;
    double registeredLeftValue = MediaQuery.of(context).size.width * 0.29;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
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
                          islogin
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
                                                      style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 27,
                                                          color:
                                                              Colors.grey[400]),
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
                                                      style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 32,
                                                          color: Colors.white),
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
                                                          color: Colors.white)),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      margin: EdgeInsets.only(
                                                        left: 30,
                                                      ),
                                                      height: 60,
                                                      child: TextField(
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      margin: EdgeInsets.only(
                                                        left: 30,
                                                      ),
                                                      height: 60,
                                                      child: TextField(
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
                                                        Text(
                                                          "Forgot Password ?",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white),
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
                                                            color: Colors.white,
                                                            spreadRadius: 1,
                                                            blurRadius: 0)
                                                      ]),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                    },
                                                    elevation: 2,
                                                    child: Text(
                                                      "Login",
                                                      style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                              : Container()
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
              islogin
                  ? Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.11,
                      left: loginLeftValue,
                      child: GestureDetector(
                        onTap: () {
                          if (islogin) {
                            setState(() {
                              islogin = true;
                            });
                          }
                        },
                        child: Text(
                          islogin
                              ? " New User? Sign Up"
                              : "",
                          style: GoogleFonts.roboto(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Container()
            ],
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
