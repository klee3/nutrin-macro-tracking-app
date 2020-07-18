import 'package:http/http.dart' as http;
import 'package:dotenv/dotenv.dart' show load, env;

class UserClient {
  // var url;
  var oath2ID;
  var oath2Secret;
  var token;

  UserClient(
    // this.url,
    this.oath2ID,
    this.oath2Secret,
  );

  void init() {
    load();
    this.oath2ID = env.containsKey('AUTH2ID') ? env['OAUTH2ID'] : Error();
    this.oath2Secret =
        env.containsKey('OAUTH2SECRET') ? env['OAUTH2SECRET'] : Error();
  }

  void getToken() async {
    var url = 'https://oauth.fatsecret.com/connect/token';
    var response = await http.post(url, body: {
      'auth': {'user': oath2ID, 'password': oath2Secret},
      'headers': {'content-type': 'application/json'},
      'form': {'grant_type': 'client_credentials', 'scope': 'basic'},
      'json': 'true'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
