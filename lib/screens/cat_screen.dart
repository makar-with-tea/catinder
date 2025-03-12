import 'package:cached_network_image/cached_network_image.dart';
import 'package:catinder/models/breed_model.dart';
import 'package:catinder/views/cat_loading_indicator.dart';
import 'package:catinder/views/clickable_link.dart';
import 'package:flutter/material.dart';

import '../models/cat_model.dart';
import '../tools/error_handler.dart';

class CatScreen extends StatelessWidget {
  static const routeName = '/cat';

  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cat =
        ModalRoute.of(context)!.settings.arguments as CatModel? ?? CatModel();
    final imageUrl = cat.url;
    final breed = cat.breeds?.firstOrNull ?? BreedModel(name: 'Unknown kitty');

    return Scaffold(
      appBar: AppBar(title: Text(breed.name ?? 'Unknown kitty')),
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
                  return Image.asset('assets/kitty_back.svg');
                },
              ),

              Center(
                child: Text(
                  breed.name ?? 'Unknown kitty',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              if (breed.weight != null)
                Text('Weight: ${breed.weight!.metric} kg'),
              if (breed.temperament != null)
                Text('Temperament: ${breed.temperament}'),
              if (breed.origin != null)
                Text('Origin: ${breed.origin}', textAlign: TextAlign.left),
              if (breed.description != null)
                Text('Description: ${breed.description}'),
              if (breed.lifeSpan != null)
                Text('Life span: ${breed.lifeSpan} years'),
              if (breed.altNames != null && breed.altNames!.isNotEmpty)
                Text('Alternative names: ${breed.altNames}'),

              SizedBox(height: 10),
              Center(
                child: Text(
                  'Characteristics (1-5 scale)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (breed.adaptability != null)
                Text('Adaptability: ${breed.adaptability}'),
              if (breed.childFriendly != null)
                Text('Child friendly: ${breed.childFriendly}'),
              if (breed.dogFriendly != null)
                Text('Dog friendly: ${breed.dogFriendly}'),
              if (breed.strangerFriendly != null)
                Text('Stranger friendly: ${breed.strangerFriendly}'),
              if (breed.affectionLevel != null)
                Text('Affection level: ${breed.affectionLevel}'),
              if (breed.energyLevel != null)
                Text('Energy level: ${breed.energyLevel}'),
              if (breed.intelligence != null)
                Text('Intelligence: ${breed.intelligence}'),
              if (breed.sheddingLevel != null)
                Text('Shedding level: ${breed.sheddingLevel}'),
              if (breed.intelligence != null)
                Text('Intelligence: ${breed.intelligence}'),
              if (breed.grooming != null) Text('Grooming: ${breed.grooming}'),
              if (breed.healthIssues != null)
                Text('Health issues: ${breed.healthIssues}'),
              if (breed.socialNeeds != null)
                Text('Social needs: ${breed.socialNeeds}'),
              if (breed.vocalisation != null)
                Text('Vocalisation: ${breed.vocalisation}'),

              if (breed.tags != null)
                SizedBox(height: 10),
              if (breed.tags != null)
                Center(
                  child: Text(
                    'Tags',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              if (breed.tags != null)
                for (final tag in breed.tags!) Text(tag),

              if (breed.wikipediaUrl != null)
                SizedBox(height: 10),
              if (breed.wikipediaUrl != null)
                Center(
                  child: Text(
                    'More info',
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
