import 'package:encrypt/encrypt.dart';

class AesUtils {
  static String encrypt(String content) {
    final key = Key.fromUtf8("sdjurli%*iw18s^1");
    final iv = IV.fromUtf8("sdjurli%*iw18s^1");
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));
    final encrypted = encrypter.encrypt(content, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String content) {
    final key = Key.fromUtf8("sdjurli%*iw18s^1");
    final iv = IV.fromUtf8("sdjurli%*iw18s^1");
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(content), iv: iv);
    return decrypted;
  }
}
