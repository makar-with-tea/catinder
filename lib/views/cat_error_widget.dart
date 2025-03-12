import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatErrorWidget extends StatelessWidget {
  final VoidCallback onReload;

  const CatErrorWidget({super.key, required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/kitty_back.svg',
              semanticsLabel: 'Cat shows its back',
            ),
            Text(
              'Sorry, cats seem to be hiding from you :(\nPlease try again!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: onReload, child: Text('Reload')),
          ],
        ),
      ),
    );
  }
}
