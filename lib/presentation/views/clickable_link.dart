import 'package:catinder/tools/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableLink extends StatelessWidget {
  final String url;

  const ClickableLink({super.key, required this.url});

  void _launchURL() async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ErrorHandler.recordError('Failed to launch $url: $e', StackTrace.current);
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
