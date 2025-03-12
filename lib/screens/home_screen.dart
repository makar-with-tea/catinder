import 'package:catinder/views/cat_loading_indicator.dart';
import 'package:catinder/views/reaction_button.dart';
import 'package:catinder/views/tinder_card.dart';
import 'package:flutter/material.dart';

import '../models/cat_model.dart';
import '../services/cat_service.dart';
import '../tools/error_handler.dart';
import '../tools/logger.dart';
import '../views/cat_error_widget.dart';
import 'cat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isError = false;
  final service = CatService();
  int _likeCnt = 0;
  List<CatModel> cats = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    updateData(limit: 3);
  }

  Future<void> updateData({int limit = 1}) async {
    try {
      final catList = await service.fetchCats(limit: limit);
      for (var cat in catList) {
        setState(() {
          cats.insert(0, cat);
        });
        logger.info(cat);
      }
    } catch (error, stackTrace) {
      ErrorHandler.recordError(error, stackTrace);
    }
    setState(() {
      isLoading = false;
      isError = false;
    });
    logger.info(cats);
    if (cats.isEmpty) {
      setState(() {
        isError = true;
      });
    }
  }

  void _onLike() {
    setState(() {
      _likeCnt++;
      cats = List.of(cats)..removeLast();
      logger.info('killed by like: $cats');
    });
    updateData();
  }

  void _onDislike() {
    setState(() {
      cats = List.of(cats)..removeLast();
      logger.info('killed by dislike: $cats');
    });
    updateData();
  }

  void _onCatTap(CatModel cat) {
    Navigator.pushNamed(context, CatScreen.routeName, arguments: cat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Catinder'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children:
                      cats.indexed.map((pair) {
                        logger.info(pair);
                        return TinderCard(
                          cat: pair.$2,
                          onSwipe: (swipe) {
                            if (swipe == SwipeDirection.right) {
                              _onLike();
                            } else {
                              _onDislike();
                            }
                          },
                          onTap: () => _onCatTap(pair.$2),
                          canSwipe: pair.$1 == cats.length - 1,
                        );
                      }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReactionButton(
                        icon: Icon(Icons.heart_broken_sharp),
                        onPressed: _onDislike,
                    ),
                    ReactionButton(
                      icon: Icon(Icons.favorite),
                      onPressed: _onLike,
                    ),
                  ],
                ),
                Text('You liked $_likeCnt cats🐈'),
              ],
            ),
          ),
          if (isError)
            CatErrorWidget(
              onReload: () {
                setState(() {
                  isLoading = true;
                });
                updateData(limit: 3);
              },
            ),
          if (isLoading)
            Container(
              color: Colors.black54,
              child: Center(child: CatLoadingIndicator()),
            ),
        ],
      ),
    );
  }
}
