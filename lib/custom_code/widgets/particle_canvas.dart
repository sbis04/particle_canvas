// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'dart:async';
import 'dart:math';

class ParticleCanvas extends StatefulWidget {
  const ParticleCanvas({
    Key? key,
    this.width,
    this.height,
    this.particleGroupRadius = 30.0,
    this.particleMaxSize = 6.0,
    this.effectDuration = 5.0,
    this.numberOfParticles = 12,
    this.gapBetweenDrawFraction = 0.5,
    this.particleColor = Colors.tealAccent,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double particleGroupRadius;
  final double particleMaxSize;
  final double effectDuration;
  final int numberOfParticles;
  final double gapBetweenDrawFraction;
  final Color particleColor;

  @override
  State<ParticleCanvas> createState() => _ParticleCanvasState();
}

class _ParticleCanvasState extends State<ParticleCanvas> {
  double dx = 0;
  double dy = 0;

  late double gapBetweenParticleDraws;

  Offset? currentPos;
  List<ParticleGroup> particleGroups = [];
  Timer? _timer;

  void startTimer() {
    var start = widget.effectDuration;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          particleGroups.clear();
        } else {
          start--;
        }
      },
    );
  }

  @override
  void initState() {
    gapBetweenParticleDraws =
        widget.particleGroupRadius * widget.gapBetweenDrawFraction;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final canvasSize = MediaQuery.of(context).size;
    return GestureDetector(
      onPanUpdate: (details) {
        _timer?.cancel();
        final updatedGlobalPos = details.globalPosition;
        if (currentPos == null) {
          setState(() => currentPos = updatedGlobalPos);
          return;
        }
        if ((updatedGlobalPos.dx - currentPos!.dx).abs() >
                gapBetweenParticleDraws ||
            (updatedGlobalPos.dy - currentPos!.dy).abs() >
                gapBetweenParticleDraws) {
          setState(() => currentPos = updatedGlobalPos);
          double dx;
          if (updatedGlobalPos.dx > canvasSize.width / 2) {
            dx = (updatedGlobalPos.dx - canvasSize.width / 2) * 2;
          } else {
            dx = -(canvasSize.width / 2 - updatedGlobalPos.dx) * 2;
          }
          double dy;
          if (updatedGlobalPos.dy > canvasSize.height / 2) {
            dy = (updatedGlobalPos.dy - canvasSize.height / 2) * 2;
          } else {
            dy = -(canvasSize.height / 2 - updatedGlobalPos.dy) * 2;
          }
          final relativePosition = Offset(dx, dy);
          particleGroups.add(ParticleGroup(
            radius: widget.particleGroupRadius,
            pos: relativePosition,
            particleMaxSize: widget.particleMaxSize,
            effectDuration: widget.effectDuration,
            particleColor: widget.particleColor,
            numberOfParticles: widget.numberOfParticles,
          ));
        }
      },
      onPanEnd: (details) {
        startTimer();
        setState(() {
          currentPos = null;
        });
      },
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            for (int i = 0; i < particleGroups.length; i++) particleGroups[i],
          ],
        ),
      ),
    );
  }
}

// The size can be between 1 and 6
// opacity based on time (TTL --> 5 seconds)
// dissipation direction shifts based on the direction of point movement
// and opposite to the motion.

// "velocity" provided from outside the particle class
// particle class will have opacity animation and random size shrinking algo

// -ve value to left
// +ve value to right
class ParticleGroup extends StatelessWidget {
  const ParticleGroup({
    Key? key,
    this.radius = 30.0,
    required this.pos,
    this.particleMaxSize = 6.0,
    this.effectDuration = 5,
    this.particleColor = Colors.tealAccent,
    this.numberOfParticles = 20,
  }) : super(key: key);

  final double radius;
  final Offset pos;
  final double particleMaxSize;
  final double effectDuration;
  final Color particleColor;
  final int numberOfParticles;

  Offset generateRandomPosInsideCircle(double radius, Offset center) {
    final randomDouble = Random().nextDouble();
    double r = radius * sqrt(randomDouble);
    final theta = randomDouble * 2 * pi;
    final x = center.dx + r * cos(theta);
    final y = center.dy + r * sin(theta);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: pos.dx,
      top: pos.dy,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: List.generate(numberOfParticles, (index) {
          // 30 - 6 (max size of particle)
          final point = generateRandomPosInsideCircle(radius - 6, Offset.zero);
          return Positioned.fill(
            top: point.dx,
            left: point.dy,
            child: Align(
              alignment: Alignment.center,
              child: Particle(
                isRight: false,
                particleMaxSize: particleMaxSize,
                effectDurationInSeconds: effectDuration,
                particleColor: particleColor,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class Particle extends StatefulWidget {
  const Particle({
    Key? key,
    required this.isRight,
    required this.particleMaxSize,
    required this.effectDurationInSeconds,
    required this.particleColor,
  }) : super(key: key);

  final bool isRight;
  final double effectDurationInSeconds;
  final double particleMaxSize;
  final Color particleColor;

  @override
  State<Particle> createState() => _ParticleState();
}

class _ParticleState extends State<Particle> with TickerProviderStateMixin {
  late Animation<double> opacityAnimation;
  late Animation<double> sizeAnimation;
  late Animation<Offset> moveAnimation;
  late AnimationController fullDurationController;
  late AnimationController randomDurationController;

  @override
  void initState() {
    super.initState();
    fullDurationController = AnimationController(
        duration: Duration(seconds: widget.effectDurationInSeconds.toInt()),
        vsync: this);
    final randomDuration =
        Random().nextDouble() * widget.effectDurationInSeconds;
    randomDurationController = AnimationController(
        duration: Duration(seconds: randomDuration.toInt()), vsync: this);
    final fullDurationCurve = CurvedAnimation(
        parent: fullDurationController, curve: Curves.easeInOut);
    final randomDurationCurve = CurvedAnimation(
        parent: randomDurationController, curve: Curves.easeInOut);
    final opacityTween = Tween<double>(begin: 1, end: 0);
    final randomMinParticleSize =
        Random().nextDouble() * (widget.particleMaxSize - 1);
    final sizeTween = Tween<double>(
        begin: widget.particleMaxSize, end: randomMinParticleSize);
    final moveOffsetDx = widget.isRight ? 20.0 : -20.0;
    final moveTween =
        Tween<Offset>(begin: Offset.zero, end: Offset(moveOffsetDx, -5));
    opacityAnimation = opacityTween.animate(fullDurationCurve)
      ..addListener(() => setState(() {}));
    sizeAnimation = sizeTween.animate(randomDurationCurve)
      ..addListener(() => setState(() {}));
    moveAnimation = moveTween.animate(fullDurationCurve)
      ..addListener(() => setState(() {}));

    // start the animations
    fullDurationController.forward();
    randomDurationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var particleSize = sizeAnimation.value;
    var particleOpacity = opacityAnimation.value;
    return RawParticle(
      particleColor: widget.particleColor,
      particleOpacity: particleOpacity,
      particleSize: particleSize,
      particleOffsetAnim: moveAnimation,
    );
  }
}

class RawParticle extends StatelessWidget {
  const RawParticle({
    Key? key,
    required this.particleOpacity,
    required this.particleSize,
    required this.particleOffsetAnim,
    required this.particleColor,
  }) : super(key: key);

  final double particleOpacity;
  final double particleSize;
  final Animation<Offset> particleOffsetAnim;
  final Color particleColor;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: particleOffsetAnim,
      child: Opacity(
        opacity: particleOpacity,
        child: Container(
          height: particleSize,
          width: particleSize,
          decoration: BoxDecoration(
            color: particleColor,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
