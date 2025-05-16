import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import '../../tools/error_handler.dart';
import '../cubit/liked/liked_cats_cubit.dart';
import '../cubit/liked/liked_cats_state.dart';
import '../di/di.dart';
import '../navigation/navigation_service.dart';
import '../views/cat_loading_indicator.dart';
import 'cat_screen.dart';

class LikedCatsScreen extends StatelessWidget {
  static const routeName = '/liked_cats';

  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final likedCatsCubit =
        ModalRoute.of(context)?.settings.arguments as LikedCatsCubit;

    return BlocProvider.value(
      value: likedCatsCubit,
      child: BlocBuilder<LikedCatsCubit, LikedCatsState>(
        builder: (context, state) {
          if (state is LikedCatsMain) {
            return Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).likedCatsTitle),
                actions: [
                  DropdownButton<String>(
                    value: state.selectedBreed,
                    items:
                        context
                            .read<LikedCatsCubit>()
                            .breeds
                            .map(
                              (breed) => DropdownMenuItem(
                                value: breed,
                                child: Text(breed),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      context.read<LikedCatsCubit>().filterByBreed(
                        value ?? S.of(context).allBreedsOption,
                      );
                    },
                  ),
                ],
              ),
              body:
                  state.likedCats.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(S.of(context).likedCatsEmpty),
                            SizedBox(
                              height: 300,
                              child: SvgPicture.asset(
                                'assets/kitty_back.svg',
                                semanticsLabel:
                                    S.of(context).kittyBackDescription,
                              ),
                            ),
                          ],
                        ),
                      )
                      : ListView.builder(
                        itemCount: state.likedCats.length,
                        itemBuilder: (context, index) {
                          final cat = state.likedCats[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: ListTile(
                              onTap: () {
                                getIt<NavigationService>().navigateTo(
                                  CatScreen.routeName,
                                  arguments: cat,
                                );
                              },
                              leading: CachedNetworkImage(
                                width: 50,
                                height: 50,
                                imageUrl: cat.url ?? '',
                                placeholder:
                                    (context, url) => CatLoadingIndicator(),
                                errorWidget: (context, url, error) {
                                  ErrorHandler.recordError(
                                    error,
                                    StackTrace.current,
                                  );
                                  return SvgPicture.asset(
                                    'assets/kitty_back.svg',
                                  );
                                },
                              ),
                              title: Text(
                                cat.breeds?.first.name ??
                                    S.of(context).unknownCat,
                              ),
                              subtitle: Text(
                                DateFormat('yyyy-MM-dd').format(cat.dateTime),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  context.read<LikedCatsCubit>().unlikeCat(cat);
                                },
                              ),
                            ),
                          );
                        },
                      ),
            );
          } else {
            // Unknown states
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                barrierDismissible: true,
                barrierColor: Colors.black54,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text(S.of(context).likedCatsErrorTitle),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(S.of(context).likedCatsErrorMessage),
                        SizedBox(
                          height: 200,
                          child: SvgPicture.asset(
                            'assets/kitty_back.svg',
                            semanticsLabel: S.of(context).kittyBackDescription,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // close the dialog
                          getIt<NavigationService>().goBack();
                          // go back to home screen
                          getIt<NavigationService>().goBack();
                        },
                        child: Text(S.of(context).likedCatsErrorButton),
                      ),
                    ],
                  );
                },
              );
            });
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
