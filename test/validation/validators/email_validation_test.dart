import 'package:faker/faker.dart';
import 'package:for_dev/validation/validators/email_validation.dart';
import 'package:test/test.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation(field: 'any_field');
  });
  test('Should return null if email is empty', () {
    final error = sut.validate('');

    expect(error, null);
  });

  test('Should return null if email is null', () {
    final error = sut.validate(null);

    expect(error, null);
  });

  test('Should return null if email is valid', () {
    final email = faker.internet.email();

    final error = sut.validate(email);

    expect(error, null);
  });

  test('Should return error if email is invalid', () {
    final email = 'kevin.koborigmail.com';

    final error = sut.validate(email);

    expect(error, 'Invalid field');
  });
}
