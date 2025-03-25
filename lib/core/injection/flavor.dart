enum Flavor {
  dev,
  prod,
}

class FlavorConfig {
  final Flavor flavor;
  final String appName;

  static late FlavorConfig instance;

  FlavorConfig._internal(this.flavor, this.appName);

  static void init({required Flavor flavor}) {
    instance = FlavorConfig._internal(
      flavor,
      flavor == Flavor.dev ? "Dev wings_crop" : "wings_crop",
    );
  }

  bool get isDev => flavor == Flavor.dev;
  bool get isProd => flavor == Flavor.prod;
}
