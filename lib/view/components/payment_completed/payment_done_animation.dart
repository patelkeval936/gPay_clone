import 'package:flutter/material.dart';
import '/values/app_colors.dart';
import '../../../values/app_values.dart';
import 'circle.dart';

class PaymentDoneAnimation extends StatefulWidget {
  const PaymentDoneAnimation({super.key});

  @override
  State<PaymentDoneAnimation> createState() => _PaymentDoneAnimationState();
}

class _PaymentDoneAnimationState extends State<PaymentDoneAnimation>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  late Animation<double> _outerScaleAnimation;
  late Animation<double> _innerScaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<RelativeRect> _transitionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _transitionAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 300, 0, 0),
      end: const RelativeRect.fromLTRB(0, -100, 0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _outerScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
      ),
    );

    _innerScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedTransition(
            rect: _transitionAnimation,
            child: ScaleTransition(
              scale: _outerScaleAnimation,
              child: Center(
                child: Circle(
                  radius: width / 2.5,
                  color: AppColors.buttonColor.withOpacity(0.2),
                  child: ScaleTransition(
                    scale: _innerScaleAnimation,
                    child: Center(
                      child: Circle(
                        radius: (width / 2.5) - 30,
                        color: AppColors.buttonColor,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: const Icon(
                            Icons.check_rounded,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
