import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../app/app.dart';
import '../../../di_container.dart';
import '../../core.dart';

final customGraphLink = Link.from([
  AuthLink(getToken: () {
    final accessToken = preferences.getString(SharedKeys.accessToken);
    return "Bearer $accessToken";
  }),
  CustomHttpLink(
      graphQLBaseUrl: EndPoints.baseGraphUrl,
      responseInterceptor: (httpResponse) {
        log("=================================================");
        log("Response:");
        log("url:=> ${httpResponse.request!.url.path}");
        log("headers:=> ${httpResponse.request!.headers}");
        log("statusCode:=> ${httpResponse.statusCode}");
        log("body:: hasData: ${httpResponse.body.isNotEmpty}");
        log("${httpResponse.runtimeType}");
        log("=================================================");

        if (httpResponse.statusCode == 401 ||
            httpResponse.body.toLowerCase().contains("unauthorized")) {
          preferences.clear();
          navigatorKey.currentContext!.goNamed(Routes.login);
        }
      })
]);
