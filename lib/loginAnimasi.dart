import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import './home.dart';

class StartAnimasi extends StatefulWidget {
  final AnimationController buttonController;
  final Animation shrinkButtonAnimation;
  final Animation zoomAnimation;
  final String user, pass;

  StartAnimasi({Key key, this.buttonController, this.user, this.pass})
      : shrinkButtonAnimation = Tween(begin: 300.0, end: 70.0).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(0.0, 0.150),
          ),
        ),
        zoomAnimation = Tween(begin: 70.0, end: 900.0).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(0.550, 0.999, curve: Curves.bounceInOut),
          ),
        ),
        super(key: key);

  Widget _buildAnimasi(_, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0),
      child: zoomAnimation.value <= 300
          ? Container(
              alignment: FractionalOffset.center,
              width: shrinkButtonAnimation.value,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(const Radius.circular(30))),
              child: shrinkButtonAnimation.value > 75
                  ? Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3),
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    ),
            )
          : user == 'arip'
              ? Container(
                  width: zoomAnimation.value,
                  height: zoomAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: zoomAnimation.value < 600
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                  ),
                )
              : Container(
                  alignment: FractionalOffset.center,
                  width: shrinkButtonAnimation.value,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(30))),
                  child: shrinkButtonAnimation.value > 75
                      ? Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3),
                        )
                      : CircularProgressIndicator(
                          strokeWidth: 1.0,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.pink),
                        ),
                ),
    );
  }

  @override
  _StartAnimasiState createState() => _StartAnimasiState();
}

class _StartAnimasiState extends State<StartAnimasi> {
  @override
  Widget build(BuildContext context) {
    widget.buttonController.addListener(() {
      if (widget.zoomAnimation.isCompleted) {
        if (widget.user == 'arip') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Home(),
          ));
        }
      }
    });

    return AnimatedBuilder(
      builder: widget._buildAnimasi,
      animation: widget.buttonController,
    );
  }
}
