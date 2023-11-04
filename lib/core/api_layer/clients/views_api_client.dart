import 'package:anuj_yadav/core/api_layer/dio/dio_client.dart';
import 'package:anuj_yadav/core/config/environment.dart';

class ViewsApiClient extends DioClient {
  ViewsApiClient()
      : super(
          baseUrl: Environment.instance.viewsBaseUrl,
          isAuthenticatorRequired: false,
        );
}
