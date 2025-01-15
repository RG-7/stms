import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  ConnectivityProvider() {
    _initializeConnectivity();
    _listenToConnectivityChanges();
  }

  Future<void> _initializeConnectivity() async {
    try {
      _connectionStatus = await _connectivity.checkConnectivity();
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing connectivity: $e');
    }
  }

  void _listenToConnectivityChanges() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      _connectionStatus = result;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
