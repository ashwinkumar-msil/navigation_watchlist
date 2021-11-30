import 'package:navigation_watchlist/model/contact_data_model.dart';
import 'package:navigation_watchlist/service/network.dart';
import 'package:navigation_watchlist/src/string.dart';

class ContactService {
  @override
  Future<List<Contact>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(Strings.contactUrl);
    var contactdata = contactFromJson(response);
    return contactdata;
  }
}
