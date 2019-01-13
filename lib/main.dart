import 'package:flutter/material.dart';
import './loginAnimasi.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Animasi",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var statusClick = 0;
  String msg='';

  TextEditingController editingControllerUser;
  TextEditingController editingControllerPass;
  AnimationController animationControllerButton;

  @override
  void initState() {
    editingControllerUser = TextEditingController(text: '');
    editingControllerPass = TextEditingController(text: '');

    super.initState();
    animationControllerButton = AnimationController(
        duration: Duration(
          seconds: 3,
        ),
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            statusClick = 0;
            msg = "Username atau Password Salah !!";
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    animationControllerButton.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await animationControllerButton.forward();
      await animationControllerButton.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://www.hipwee.com/wp-content/uploads/2016/07/hipwee-w-123mobilewallpapers-com.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          child: ListView(
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 270),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12),
                            ),
                            TextField(
                              controller: editingControllerUser,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_pin,
                                  color: Colors.white,
                                ),
                                hintText: "Username",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                            ),
                            TextField(
                              controller: editingControllerPass,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: "Password",
                              ),
                            ),
                            Text(msg, style: TextStyle(color: Colors.white, fontSize: 16.0),),
                            FlatButton(
                              padding:
                                  const EdgeInsets.only(top: 180, bottom: 30),
                              onPressed: null,
                              child: Text(
                                "Tidak bisa login? Silahkan hubungi puskom",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          statusClick = 1;
                        });
                        _playAnimation();
                      },
                      child: statusClick == 0
                          ? SignIn()
                          : StartAnimasi(
                              buttonController: animationControllerButton.view,
                              user: editingControllerUser.text,
                              pass: editingControllerPass.text,
                            )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(70.0),
      child: Container(
        alignment: FractionalOffset.center,
        width: 300,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.all(const Radius.circular(30))),
        child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3),
        ),
      ),
    );
  }
}
