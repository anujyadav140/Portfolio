import 'package:anuj_yadav/core/api_layer/dio/dio_client.dart';
import 'package:anuj_yadav/core/config/environment.dart';

class LikesApiClient extends DioClient {
  LikesApiClient()
      : super(
          baseUrl: Environment.instance.likesBaseUrl,
          isAuthenticatorRequired: false,
        );
}
