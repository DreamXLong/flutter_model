import 'package:get/get.dart';

class RtMapConfiguration {
  /* 基础url */
  final String baseUrl;

  RtMapConfiguration(
    this.baseUrl,
  );
}

class EnvConfiguration {
  RtMapConfiguration rtMapConfiguration;

  EnvConfiguration({required this.rtMapConfiguration});

  static EnvConfiguration get value => Get.find();
}
