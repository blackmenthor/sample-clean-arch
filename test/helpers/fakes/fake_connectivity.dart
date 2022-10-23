import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeConnectivity extends Fake implements Connectivity {
  FakeConnectivity({
      this.connected = true,
  });

  final bool connected;

  @override
  Future<ConnectivityResult> checkConnectivity() {
    if (connected) {
      return Future.value(ConnectivityResult.wifi);
    }
    return Future.value(ConnectivityResult.none);
  }

}