import 'package:anuj_yadav/core/api_layer/dio/dio_client.dart';
import 'package:anuj_yadav/core/config/environment.dart';

class VideosApiClient extends DioClient {
  VideosApiClient()
      : super(
          baseUrl: Environment.instance.videosBaseUrl,
          isAuthenticatorRequired: false,
        );
}
