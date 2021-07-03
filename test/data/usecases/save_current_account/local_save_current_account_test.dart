import 'package:faker/faker.dart';
import 'package:for_dev/domain/helpers/helpers.dart';
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
    try {
      await saveSecureCachedStorage.saveSecure(
          key: 'token', value: account.token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}

abstract class SaveSecureCachedStorage {
  Future<void> saveSecure({@required String key, @required String value});
}

class SaveSecureCachedStorageSpy extends Mock
    implements SaveSecureCachedStorage {}

void main() {
  test('Should call SaveSecureCacheStorage with correct values', () async {
    final saveSecureCachedStorage = SaveSecureCachedStorageSpy();
    final sut = LocalSaveCurrentAccount(
        saveSecureCachedStorage: saveSecureCachedStorage);
    final account = AccountEntity(token: faker.guid.guid());

    await sut.save(account);

    verify(
        saveSecureCachedStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws',
      () async {
    final saveSecureCachedStorage = SaveSecureCachedStorageSpy();
    final sut = LocalSaveCurrentAccount(
        saveSecureCachedStorage: saveSecureCachedStorage);
    final account = AccountEntity(token: faker.guid.guid());
    when(saveSecureCachedStorage.saveSecure(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });
}
