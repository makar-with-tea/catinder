import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/logger.dart';

class ClickableLink extends StatelessWidget {
  final String url;

  const ClickableLink({super.key, required this.url});

  void _launchURL() async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      logger.severe('Failed to launch $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Text(
        url,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
