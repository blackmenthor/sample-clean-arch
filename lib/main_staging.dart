import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/view/app.dart';
import 'package:flutter_clean_arch/bootstrap.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/models/credentials.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies(env: Environment.staging);

  bootstrap(App.new);
}
