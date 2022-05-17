import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) {
  final statuCode = response.statusCode;
  final reasonPhrase = response.reasonPhrase;

  final String errorMessage =
      'Request failed\nStatus Code: $statuCode\nReason: $reasonPhrase';

  print(errorMessage);

  return errorMessage;
}
