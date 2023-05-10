import 'package:get/get.dart';

import '../flavors/build_config.dart';
import '../network/api_provider.dart';
import '../network/repository.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<ApiProvider>(
      () async {
        return ApiProvider(baseUrl: BuildConfig.instance.config.baseUrl);
      },
      permanent: true,
    );
    Get.put<Repository>(Repository(), permanent: true);
  }
}
