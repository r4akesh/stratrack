import 'package:flutter/material.dart';

class TimeCounderProgressBar extends StatefulWidget {
  const TimeCounderProgressBar({Key? key}) : super(key: key);

  @override
  State<TimeCounderProgressBar> createState() => _TimeCounderProgressBarState();
}

class _TimeCounderProgressBarState extends State<TimeCounderProgressBar>
    with TickerProviderStateMixin {
  late Animation<double> _timerAnimation;
  late Animation<double> _timerCountAnimation;
  late AnimationController _timerAnimationController;

  @override
  void initState() {
    _timerAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));

    _timerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_timerAnimationController);

    _timerCountAnimation =
        Tween(begin: 30.0, end: 0.0).animate(_timerAnimationController);

    _timerAnimationController.forward();

    _timerAnimationController.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        // animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // animationController.forward();
      }
    });
    // animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _timerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int seconds = 30;
    int buildTime = 0;
    return AnimatedBuilder(
      animation: _timerAnimation,
      builder: (context, child) {
        buildTime++;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12,
              width: 12,
              child: CircularProgressIndicator(
                value: _timerAnimation.value,
                backgroundColor: Colors.green,
                valueColor: AlwaysStoppedAnimation(
                  Colors.red,
                ),
                strokeWidth: 12,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 50,
              child: Text(
                "00:${int.parse(_timerCountAnimation.value.toStringAsFixed(0)).toString().padLeft(2, '0')}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )
          ],
        );
      },
    );
  }
}

Widget getProg(context) {
  int seconds = 30;
  int buildTime = 0;
  late Animation<double> _timerAnimation;
  late Animation<double> _timerCountAnimation;
  late AnimationController _timerAnimationController;

  _timerAnimationController =
      AnimationController(vsync: context, duration: Duration(seconds: 30));

  _timerAnimation =
      Tween(begin: 0.0, end: 1.0).animate(_timerAnimationController);

  _timerCountAnimation =
      Tween(begin: 30.0, end: 0.0).animate(_timerAnimationController);

  _timerAnimationController.forward();

  _timerAnimationController.addStatusListener((status) {
    print(status);
    if (status == AnimationStatus.completed) {
      // animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      // animationController.forward();
    }
  });
  // animationController.forward();

  return AnimatedBuilder(
    animation: _timerAnimation,
    builder: (context, child) {
      buildTime++;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
            width: 12,
            child: CircularProgressIndicator(
              value: _timerAnimation.value,
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(
                Colors.red,
              ),
              strokeWidth: 12,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 50,
            child: Text(
              "00:${int.parse(_timerCountAnimation.value.toStringAsFixed(0)).toString().padLeft(2, '0')}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        ],
      );
    },
  );
}
