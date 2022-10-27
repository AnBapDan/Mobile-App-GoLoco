// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class FingerPrint {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason:
              'Usa a impressão digital para desbloquear a aplicação',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              biometricNotRecognized: 'Não Reconhecido. Tenta Novamente',
              biometricSuccess: 'Impressão Digital Reconhecida',
              biometricHint: 'Autenticação da aplicação',
              signInTitle: 'Impressão Digital Necessária',
              cancelButton: 'Recusar',
            ),
          ]);
    } on PlatformException catch (e) {
      return false;
    }
  }
}
