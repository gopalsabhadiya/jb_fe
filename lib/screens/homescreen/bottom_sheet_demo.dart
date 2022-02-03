import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo>
    with TickerProviderStateMixin {
  bool draggedUp = false;
  bool draggedDown = false;

  late Animation<Offset> animation;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.SHORT,
    );
    animation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -0.5))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      onClosing: () {
        // Do something
      },
      builder: (BuildContext ctx) => Stack(
        children: <Widget>[
          SlideTransition(
            position: animation,
            child: Container(
              width: double.infinity,
              height: 250,
              alignment: Alignment.center,
              child: GestureDetector(
                onVerticalDragDown: (details) {
                  int sensitivity = 8;
                  print("Dragged vertically down");
                },
                onVerticalDragEnd: (details) {
                  print("Dragged vertically down: $details");
                },
                onVerticalDragUpdate: (details) {
                  int sensitivity = 8;
                  if (details.delta.dy > sensitivity) {
                    print("Dragged vertically up");
                    animationController.reverse();
                    setState(() {
                      draggedUp = true;
                    });
                  } else if (details.delta.dy < -sensitivity) {
                    animationController.forward();
                    print("Dragged vertically down");
                    setState(() {
                      draggedDown = true;
                    });
                  }
                },
                child: ElevatedButton(
                  child: const Text(
                    'Close this bottom sheet',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print("Close sheet");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
