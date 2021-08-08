import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:slide_popup_dialog/pill_gesture.dart';

class SlideDialog extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color pillColor;
  final double heightRatio;

  SlideDialog(
      {@required this.child,
      @required this.pillColor,
      @required this.backgroundColor,
      this.heightRatio = 2.5});

  @override
  _SlideDialogState createState() => _SlideDialogState();
}

class _SlideDialogState extends State<SlideDialog> {
  var _initialPosition = 0.0;
  var _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final temp = (widget.heightRatio * 2.22) / 10;
    final temp2 = deviceHeight / widget.heightRatio * .921 ?? 2.5 + _currentPosition;
    print("temp2 ---> " + temp2.toString());
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          EdgeInsets.only(
              top: temp2),
      duration: Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 48,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xffffffff),
                      border: Border.all(color: Color(0xffffffff), width: 7)),
                  alignment: Alignment.center,
                ),
                PillGesture(
                  pillColor: widget.pillColor,
                  onVerticalDragStart: _onVerticalDragStart,
                  onVerticalDragEnd: _onVerticalDragEnd,
                  onVerticalDragUpdate: _onVerticalDragUpdate,
                )
              ],
            ),
            SizedBox(
              height: Dimen.form_field_sepereator_space,
            ),
            Container(
              width: deviceWidth,
              height: deviceHeight * temp,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
              ),
              child: Material(
                color: widget.backgroundColor ??
                    Theme.of(context).dialogBackgroundColor,
                elevation: 24.0,
                type: MaterialType.card,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                    ),
                    widget.child,
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onVerticalDragStart(DragStartDetails drag) {
    print("_onVerticalDragStart");
    setState(() {
      _initialPosition = drag.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails drag) {
    setState(() {
      final temp = _currentPosition;
      _currentPosition = drag.globalPosition.dy - _initialPosition;
      if (_currentPosition < 0) {
        _currentPosition = temp;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails drag) {
    if (_currentPosition > 100.0) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      _currentPosition = 0.0;
    });
  }
}
