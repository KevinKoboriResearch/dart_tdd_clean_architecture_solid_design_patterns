import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCachedStorage saveSecureCachedStorage;
  LocalSaveCurrentAccount({
    @required this.saveSecureCachedStorage,
  });
  Future<void> save(AccountEntity account) async {
    await saveSecureCachedStorage.saveSecure(
        key: 'token', value: account.token);
  }
}

abstract class SaveSecureCachedStorage {
  Future<void> saveSecure({@required String key, @required String value});
}

class SaveSecureCachedStorageSpy extends Mock
    implements SaveSecureCachedStorage {}

void main() {
  test('Should call CashStorage with correct values', () async {
    final saveSecureCachedStorage = SaveSecureCachedStorageSpy();
    final sut = LocalSaveCurrentAccount(
        saveSecureCachedStorage: saveSecureCachedStorage);
    final account = AccountEntity(token: faker.guid.guid());

    await sut.save(account);

    verify(
        saveSecureCachedStorage.saveSecure(key: 'token', value: account.token));
  });
}
