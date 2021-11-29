import 'package:navigation_watchlist/model/contact_data_model.dart';
import 'package:navigation_watchlist/service/network.dart';
import 'package:navigation_watchlist/src/string.dart';

class ContactService {
  var contactdata;

  @override
  Future<List<Contact>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(Strings.contactUrl);
    contactdata = contactFromJson(response);
    return contactdata;
  }
}
