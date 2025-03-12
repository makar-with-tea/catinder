import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatLoadingIndicator extends StatefulWidget {
  final String assetPath = 'assets/kitty_loading.svg';

  const CatLoadingIndicator({super.key});

  @override
  State<CatLoadingIndicator> createState() => _CatLoadingIndicatorState();
}

class _CatLoadingIndicatorState extends State<CatLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SvgPicture.asset(widget.assetPath),
    );
  }
}
