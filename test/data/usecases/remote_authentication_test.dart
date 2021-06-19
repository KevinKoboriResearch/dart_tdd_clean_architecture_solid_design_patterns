import 'package:for_dev/domain/helpers/helpers.dart';
import 'package:test/test.dart';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/data/usecases/usecases.dart';

import 'package:for_dev/data/http/http.dart';

// bubble test
// Coupling - Mockito Package
class HttpClientSpy extends Mock implements HttpClient {}

main() {
  // Design Pattern "Triple A"
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;
  AuthenticationParams paramns;

  // Arrange
  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    paramns = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  });

  test('Should call HttpClient with correct values', () async {
    // Action
    await sut.auth(paramns);

    // Assert
    // Coupling - Mockito Package
    verify(httpClient.request(
      url: url,
      method: 'post',
      body: {
        'email': paramns.email,
        'password': paramns.password,
      },
    ));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    // Coupling - Mockito Package
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);

    final future = sut.auth(paramns);

    expect(future, throwsA(DomainError.unexpected));
  });

   test('Should throw UnexpectedError if HttpClient returns 404', () async {
    // Coupling - Mockito Package
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);

    final future = sut.auth(paramns);

    expect(future, throwsA(DomainError.unexpected));
  });

   test('Should throw UnexpectedError if HttpClient returns 500', () async {
    // Coupling - Mockito Package
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.serverError);

    final future = sut.auth(paramns);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 401', () async {
    // Coupling - Mockito Package
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.unauthorized);

    final future = sut.auth(paramns);

    expect(future, throwsA(DomainError.invalidCredentials));
  });
}
