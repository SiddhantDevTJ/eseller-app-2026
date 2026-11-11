import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class SslPinningConfig {
  SslPinningConfig._();

  static void configure(Dio dio, {List<String>? allowedSha256Fingerprints}) {
    if (kIsWeb) return;

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final SecurityContext context = SecurityContext(withTrustedRoots: true);
        final HttpClient client = HttpClient(context: context);

        if (allowedSha256Fingerprints != null && allowedSha256Fingerprints.isNotEmpty) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) {
            final certFingerprint = sha256
                .convert(cert.der)
                .bytes
                .map((b) => b.toRadixString(16).padLeft(2, '0'))
                .join(':')
                .toUpperCase();
            return allowedSha256Fingerprints.contains(certFingerprint);
          };
        }

        return client;
      },
    );
  }
}
