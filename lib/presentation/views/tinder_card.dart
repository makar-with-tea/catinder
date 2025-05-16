import 'package:flutter/material.dart';

import '../../domain/entity/cat.dart';
import '../../generated/l10n.dart';
import 'card_content.dart';

enum SwipeDirection { left, right }

class TinderCard extends StatefulWidget {
  final void Function(SwipeDirection direction) onSwipe;
  final void Function() onTap;
  final Cat cat;
  final bool canSwipe;

  const TinderCard({
    super.key,
    required this.onSwipe,
    required this.onTap,
    required this.cat,
    required this.canSwipe,
  });

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  final _animationDuration = const Duration(milliseconds: 300);
  Offset _position = Offset.zero;

  Size get screenSize => MediaQuery.sizeOf(context);
  double get screenWidth => screenSize.width;

  void onPanEnd() async {
    final direction =
        _position.dx > screenWidth * 0.25
            ? SwipeDirection.right
            : _position.dx < -screenWidth * 0.25
            ? SwipeDirection.left
            : null;

    if (direction == null || !widget.canSwipe) {
      _position = Offset.zero;
      return;
    }

    if (direction == SwipeDirection.right) {
      _position = Offset(screenWidth * 1.5, 0);
      await Future.delayed(_animationDuration);
      widget.onSwipe(SwipeDirection.right);
      return;
    }

    _position = Offset(-screenWidth * 1.5, 0);
    await Future.delayed(_animationDuration);
    widget.onSwipe(SwipeDirection.left);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onPanUpdate: (details) {
        setState(() {
          _position += details.delta;
        });
      },
      onPanEnd: (_) {
        setState(() {
          onPanEnd();
        });
      },
      child: AnimatedContainer(
        duration: _animationDuration,
        transform:
            Matrix4.identity()
              ..rotateZ(_position.dx / screenWidth * 0.2)
              ..translate(_position.dx, _position.dx * -0.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: CardContent(
          photoUrl: widget.cat.url,
          caption: widget.cat.breeds?[0].name ?? S.of(context).unknownCat,
        ),
      ),
    );
  }
}
