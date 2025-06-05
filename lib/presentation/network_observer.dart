import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'app_theme.dart';
import 'global.dart';

class NetworkObserver {
  static final NetworkObserver _instance = NetworkObserver._internal();
  factory NetworkObserver() => _instance;

  NetworkObserver._internal();

  final Connectivity _connectivity = Connectivity();
  final ValueNotifier<bool> isConnected = ValueNotifier(true);
  late StreamSubscription<ConnectivityResult> _subscription;
  final theme = AppTheme.theme(false);

  void startObserving() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      final bool currentlyConnected = result != ConnectivityResult.none;
      if (currentlyConnected != isConnected.value) {
        isConnected.value = currentlyConnected;
        _showSnackBar(currentlyConnected);
      }
    });
  }

  void _showSnackBar(bool connected) {
    final messenger = scaffoldMessengerKey.currentState;
    if (messenger == null) return;

    final snackBar = SnackBar(
      content: Text(
        connected
            ? S.of(messenger.context).networkAvailableSnackbar
            : S.of(messenger.context).networkUnavailableSnackbar,
        style: theme.textTheme.bodyMedium,
      ),
      backgroundColor:
          connected ? theme.colorScheme.secondary : theme.colorScheme.error,
      duration: Duration(seconds: 3),
    );

    messenger.showSnackBar(snackBar);
  }

  void dispose() {
    _subscription.cancel();
  }
}
