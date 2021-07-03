import 'package:meta/meta.dart';

abstract class SaveSecureCachedStorage {
  Future<void> saveSecure({@required String key, @required String value});
}
