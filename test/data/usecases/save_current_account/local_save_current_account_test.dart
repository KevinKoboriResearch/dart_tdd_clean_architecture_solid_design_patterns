import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/helpers/helpers.dart';
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
  SaveSecureCachedStorageSpy saveSecureCachedStorage;
  LocalSaveCurrentAccount sut;
  AccountEntity account;

  void mockError() {
    when(saveSecureCachedStorage.saveSecure(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());
  }

  setUp(() {
    saveSecureCachedStorage = SaveSecureCachedStorageSpy();
    sut = LocalSaveCurrentAccount(
        saveSecureCachedStorage: saveSecureCachedStorage);
    account = AccountEntity(token: faker.guid.guid());
  });

  test('Should call SaveSecureCacheStorage with correct values', () async {
    await sut.save(account);

    verify(
        saveSecureCachedStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws',
      () async {
    mockError();

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });
}
