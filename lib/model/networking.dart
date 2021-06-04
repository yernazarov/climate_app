import 'package:http/http.dart' as http;
import 'dart:convert';

class Networker {
  Networker(this.url);
  final Uri url;

  Future getData() async {
    http.Response r = await http.get(url);
    if (r.statusCode == 200) {
      String data = r.body;
      return jsonDecode(data);
    } else {
      print(r.statusCode);
    }
  }
}
