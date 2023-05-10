import 'package:get/get.dart';

import '../model/response/base_response.dart';
import 'api_path.dart';
import 'api_provider.dart';
import 'http_method.dart';

class Repository {
  final _apiProvider = Get.find<ApiProvider>();

  Future<BaseResponse?> getOtp() async {
    return await _apiProvider.callApi(
      path: ApiPath.getOtp,
      method: HttpMethod.POST,
    );
  }
}
