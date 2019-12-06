import 'package:flutter/material.dart';
import 'package:isiro_app/home.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        // _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 15), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          // fit: StackFit.passthrough,
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Image.asset('assets/img/bg.png'),
            ),
            Shimmer.fromColors(
              period: Duration(seconds: 5),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'ÌSIRÒ',
                    style: TextStyle(
                        fontSize: 90.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 18.0,
                            color: Colors.blueGrey,
                            offset: Offset.fromDirection(120, 12),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            // CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
