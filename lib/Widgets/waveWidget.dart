import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'widgets.dart';

class WaveWidget extends StatefulWidget {

  final Size size;
  final double yOffset;
  final Color color;

  WaveWidget({
    required this.size,
    required this.color,
    required this.yOffset
  });

  @override
  _waveWidgetState createState() => _waveWidgetState();
}

class _waveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {

  late AnimationController animationController;
  List<Offset> wavePoints = [];
  
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000))..addListener(() {
      wavePoints.clear();

      final double waveSpeed = animationController.value * 1080;
      final fullSphere = animationController.value * Math.pi * 2;
      final double normalizer = Math.cos(fullSphere);
      final double waveWidth = Math.pi/270;
      final double waveHeight = 20.0;

      for(int i = 0; i <= widget.size.width.toInt(); i++) {
        double calc = Math.sin((waveSpeed - i) * waveWidth);
        wavePoints.add(
          Offset(
            i.toDouble(),
            calc * waveHeight * normalizer + widget.yOffset
          )
        );
      }
    });
    animationController.repeat();
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(
            waveList: wavePoints
          ),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color
          ),
        );
      }
    );
  }
}