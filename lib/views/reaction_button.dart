import 'package:flutter/material.dart';

class ReactionButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const ReactionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
    );
  }

}