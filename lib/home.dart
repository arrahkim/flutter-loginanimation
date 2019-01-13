import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController animationControllerScreen;
  Animation animationScreen;
  AnimationController animationControllerCover;
  Animation animationCover;
  AnimationController animationControllerProfile;
  Animation animationProfile;
  AnimationController animationControllerDetail;
  Animation animationDetail;
  AnimationController animationControllerImage;
  Animation animationImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationControllerScreen =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationScreen =
        Tween(begin: 1.0, end: 0.0).animate(animationControllerScreen);
    animationControllerCover =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationCover = Tween(begin: 0.0, end: 240.0).animate(
      CurvedAnimation(
        parent: animationControllerCover,
        curve: Interval(0.150, 0.999, curve: Curves.bounceInOut),
      ),
    );
    animationControllerProfile =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationProfile = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationControllerProfile,
        curve: Interval(0.550, 0.999, curve: Curves.bounceOut),
      ),
    );
    animationControllerDetail =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationDetail = Tween(begin: 0.0, end: 700.0).animate(
      CurvedAnimation(
        parent: animationControllerDetail,
        curve: Interval(0.150, 0.999, curve: Curves.bounceOut),
      ),
    );
    animationControllerImage =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationImage = Tween(begin: 0.0, end: 90.0).animate(
      CurvedAnimation(
        parent: animationControllerImage,
        curve: Interval(0.550, 0.999, curve: Curves.bounceOut),
      ),
    );

    animationControllerScreen.forward();
    animationControllerCover.forward();
    animationControllerProfile.forward();
    animationControllerDetail.forward();
    _delay();
  }

  Future _delay() async {
    await Future.delayed(Duration(milliseconds: 300));
    animationControllerDetail.forward();
    animationControllerImage.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          AnimationScreen(
            animation: animationScreen,
          ),
          AnimationCover(
            animation: animationCover,
          ),
          AnimationProfile(
            animation: animationProfile,
          ),
          AnimationDetail(
            animation: animationDetail,
          ),
          AnimationImage(
            animation: animationImage,
          ),
        ],
      ),
    ));
  }
}

class AnimationScreen extends AnimatedWidget {
  AnimationScreen({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(_) {
    final Animation<double> animation = listenable;
    return Container(
      width: 900.0,
      height: 900.0,
      color: Colors.orange.withOpacity(animation.value),
    );
  }
}

class AnimationCover extends AnimatedWidget {
  AnimationCover({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(_) {
    final Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://www.hipwee.com/wp-content/uploads/2016/07/hipwee-w-123mobilewallpapers-com.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AnimationProfile extends AnimatedWidget {
  AnimationProfile({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(_) {
    final Animation<double> animation = listenable;
    return Container(
      height: 480.0,
      child: Center(
          child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
            image: DecorationImage(
              image: NetworkImage(
                  "https://2.bp.blogspot.com/-mSqdeabREqc/Wk3ZsTR78HI/AAAAAAAABBI/nyyPCEdJmLQ9iK0EXLZ4gW087IJXDLB4wCLcBGAs/s1600/upin-ipin-lari.png"),
              fit: BoxFit.cover,
            )),
      )),
    );
  }
}

class AnimationDetail extends AnimatedWidget {
  AnimationDetail({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(_) {
    final Animation<double> animation = listenable;
    return Center(
      child: SizedBox(
        height: animation.value,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 310.0),
              ),
              Text(
                "Upin Ipin",
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                "Kenari Studio",
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Upin dan Ipin Inilah dia kembar seiras itu biasa, upin dan ipin ragam aksinya..",
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "2.5 K",
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "22.5 M",
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationImage extends AnimatedWidget {
  AnimationImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(_) {
    final Animation<double> animation = listenable;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 555.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.hipwee.com/wp-content/uploads/2016/07/hipwee-w-123mobilewallpapers-com.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.hipwee.com/wp-content/uploads/2016/07/hipwee-w-123mobilewallpapers-com.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                 Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.hipwee.com/wp-content/uploads/2016/07/hipwee-w-123mobilewallpapers-com.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
