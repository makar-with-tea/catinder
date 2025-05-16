import 'package:cached_network_image/cached_network_image.dart';
import 'package:catinder/presentation/views/cat_loading_indicator.dart';
import 'package:catinder/presentation/views/clickable_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/entity/breed.dart';
import '../../domain/entity/cat.dart';
import '../../generated/l10n.dart';
import '../../tools/error_handler.dart';

class CatScreen extends StatelessWidget {
  static const routeName = '/cat';

  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cat = ModalRoute.of(context)!.settings.arguments as Cat? ?? Cat();
    final imageUrl = cat.url;
    final breed =
        cat.breeds?.firstOrNull ?? Breed(name: S.of(context).unknownCat);

    return Scaffold(
      appBar: AppBar(title: Text(breed.name ?? S.of(context).unknownCat)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                placeholder: (context, url) => CatLoadingIndicator(),
                errorWidget: (context, url, error) {
                  ErrorHandler.recordError(error, StackTrace.current);
                  return SvgPicture.asset('assets/kitty_back.svg');
                },
              ),

              Center(
                child: Text(
                  breed.name ?? S.of(context).unknownCat,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              if (breed.weightMetric != null)
                Text(S.of(context).weightLabel(breed.weightMetric!)),
              if (breed.temperament != null)
                Text(S.of(context).temperamentLabel(breed.temperament!)),
              if (breed.origin != null)
                Text(S.of(context).originLabel(breed.origin!)),
              if (breed.description != null)
                Text(S.of(context).descriptionLabel(breed.description!)),
              if (breed.lifeSpan != null)
                Text(S.of(context).lifeSpanLabel(breed.lifeSpan!)),
              if (breed.altNames != null && breed.altNames!.isNotEmpty)
                Text(S.of(context).altNamesLabel(breed.altNames!)),

              SizedBox(height: 10),
              Center(
                child: Text(
                  S.of(context).characteristicsTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (breed.adaptability != null)
                Text(
                  S
                      .of(context)
                      .adaptabilityLabel(breed.adaptability.toString()),
                ),
              if (breed.childFriendly != null)
                Text(
                  S
                      .of(context)
                      .childFriendlyLabel(breed.childFriendly.toString()),
                ),
              if (breed.dogFriendly != null)
                Text(
                  S.of(context).dogFriendlyLabel(breed.dogFriendly.toString()),
                ),
              if (breed.strangerFriendly != null)
                Text(
                  S
                      .of(context)
                      .strangerFriendlyLabel(breed.strangerFriendly.toString()),
                ),
              if (breed.affectionLevel != null)
                Text(
                  S
                      .of(context)
                      .affectionLevelLabel(breed.affectionLevel.toString()),
                ),
              if (breed.energyLevel != null)
                Text(
                  S.of(context).energyLevelLabel(breed.energyLevel.toString()),
                ),
              if (breed.intelligence != null)
                Text(
                  S
                      .of(context)
                      .intelligenceLabel(breed.intelligence.toString()),
                ),
              if (breed.sheddingLevel != null)
                Text(
                  S
                      .of(context)
                      .sheddingLevelLabel(breed.sheddingLevel.toString()),
                ),
              if (breed.grooming != null)
                Text(S.of(context).groomingLabel(breed.grooming.toString())),
              if (breed.healthIssues != null)
                Text(
                  S
                      .of(context)
                      .healthIssuesLabel(breed.healthIssues.toString()),
                ),
              if (breed.socialNeeds != null)
                Text(
                  S.of(context).socialNeedsLabel(breed.socialNeeds.toString()),
                ),
              if (breed.vocalisation != null)
                Text(
                  S
                      .of(context)
                      .vocalisationLabel(breed.vocalisation.toString()),
                ),

              if (breed.tags != null) SizedBox(height: 10),
              if (breed.tags != null)
                Center(
                  child: Text(
                    S.of(context).tagsTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              if (breed.tags != null)
                for (final tag in breed.tags!) Text(tag),

              if (breed.wikipediaUrl != null) SizedBox(height: 10),
              if (breed.wikipediaUrl != null)
                Center(
                  child: Text(
                    S.of(context).moreInfoTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              if (breed.wikipediaUrl != null)
                ClickableLink(url: breed.wikipediaUrl!),
            ],
          ),
        ),
      ),
    );
  }
}
