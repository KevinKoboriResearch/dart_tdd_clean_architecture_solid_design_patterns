import 'package:meta/meta.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

import '../../cache/cache.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCachedStorage saveSecureCachedStorage;
  LocalSaveCurrentAccount({
    @required this.saveSecureCachedStorage,
  });
  Future<void> save(AccountEntity account) async {
    try {
      await saveSecureCachedStorage.saveSecure(
          key: 'token', value: account.token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
