import 'package:cached_network_image/cached_network_image.dart';
import 'package:catinder/tools/error_handler.dart';
import 'package:catinder/views/cat_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardContent extends StatelessWidget {
  final String? photoUrl;
  final String? caption;

  const CardContent({super.key, required this.photoUrl, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: photoUrl ?? '',
                width: 300,
                height: 400,
                placeholder: (context, url) => CatLoadingIndicator(),
                errorWidget: (context, url, error) {
                  ErrorHandler.recordError(error, StackTrace.current);
                  return SvgPicture.asset('assets/kitty_back.svg');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              caption ?? 'Unknown kitty',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
