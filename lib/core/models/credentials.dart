import 'package:flutter_clean_arch/core/models/base_model.dart';

enum Environment { test, dev, staging, prod }

abstract class Credentials extends BaseModel {
  const Credentials({
    required this.baseEndpoint,
    required this.env,
  }) : super();

  final String baseEndpoint;
  final Environment env;
}

class TestCredentials extends Credentials {
  TestCredentials()
      : super(
          baseEndpoint: 'http://165.232.168.18/',
          env: Environment.test,
        );
}

class DevCredentials extends Credentials {
  DevCredentials()
      : super(
          baseEndpoint: 'http://165.232.168.18/',
          env: Environment.dev,
        );
}

class StagingCredentials extends Credentials {
  StagingCredentials()
      : super(
          baseEndpoint: 'http://165.232.168.18/',
          env: Environment.staging,
        );
}

class ProdCredentials extends Credentials {
  ProdCredentials()
      : super(
          baseEndpoint: 'http://165.232.168.18/',
          env: Environment.prod,
        );
}

final credentials = <Environment, Credentials>{
  Environment.test: TestCredentials(),
  Environment.dev: DevCredentials(),
  Environment.staging: StagingCredentials(),
  Environment.prod: ProdCredentials(),
};
