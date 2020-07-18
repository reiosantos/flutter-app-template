import 'package:san/src/index.dart';
import 'package:san/src/utilities/constants.dart';

class HttpService {
  String get baseUrl {
    return BASE_URL;
  }

  Client get client {
    var client = Client();
    return client;
  }
}
