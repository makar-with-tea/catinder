import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/usecases/fetch_cats_usecase.dart';
import '../../generated/l10n.dart';
import '../../tools/logger.dart';
import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';
import '../cubit/liked/liked_cats_cubit.dart';
import '../di/di.dart';
import '../navigation/navigation_service.dart';
import '../views/cat_loading_indicator.dart';
import '../views/reaction_button.dart';
import '../views/tinder_card.dart';
import 'cat_screen.dart';
import 'liked_cats_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logger.info('HomeScreen build');
    return BlocProvider(
      create: (_) {
        final cubit = HomeCubit(getIt<FetchCatsUseCase>());
        logger.info('HomeCubit created');
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).appName)),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Container(
                color: Colors.black54,
                child: Center(child: CatLoadingIndicator()),
              );
            } else if (state is HomeMain) {
              final cats = state.cats;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children:
                          cats.indexed.map((pair) {
                            return TinderCard(
                              cat: pair.$2,
                              onSwipe: (swipe) {
                                if (swipe == SwipeDirection.right) {
                                  context.read<HomeCubit>().likeCat(pair.$2);
                                } else {
                                  context.read<HomeCubit>().dislikeCat(pair.$2);
                                }
                              },
                              onTap: () {
                                getIt<NavigationService>().navigateTo(
                                  CatScreen.routeName,
                                  arguments: pair.$2,
                                );
                              },
                              canSwipe: pair.$1 == cats.length - 1,
                            );
                          }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReactionButton(
                          icon: Icon(Icons.heart_broken_sharp),
                          onPressed:
                              () => context.read<HomeCubit>().dislikeCat(
                                cats.last,
                              ),
                        ),
                        ReactionButton(
                          icon: Icon(Icons.favorite),
                          onPressed:
                              () =>
                                  context.read<HomeCubit>().likeCat(cats.last),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        final homeCubit = context.read<HomeCubit>();
                        final likedCats = homeCubit.likedCats;
                        getIt<NavigationService>().navigateTo(
                          LikedCatsScreen.routeName,
                          arguments: LikedCatsCubit(likedCats),
                        );
                      },
                      icon: const Icon(Icons.favorite),
                      label: Text(S.of(context).likedCatsButton),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Error state and unknown states
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.black54,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text(S.of(context).catsErrorTitle),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(S.of(context).catsErrorMessage),
                          SizedBox(
                            height: 200,
                            child: SvgPicture.asset(
                              'assets/kitty_back.svg',
                              semanticsLabel:
                                  S.of(context).kittyBackDescription,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.read<HomeCubit>().reloadCats();
                            getIt<NavigationService>().goBack();
                          },
                          child: Text(S.of(context).reloadButtonMessage),
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
      ),
    );
  }
}
