import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'package:for_dev/validation/dependencies/field_validation.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation({@required this.field});

  @override
  String validate({String value}) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value);
    return isValid ? null : 'Invalid field';
  }
}

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation(field: 'any_field');
  });
  test('Should return null if email is empty', () {
    final error = sut.validate(value: '');

    expect(error, null);
  });

  test('Should return null if email is null', () {
    final error = sut.validate(value: null);

    expect(error, null);
  });

  test('Should return null if email is valid', () {
    final email = faker.internet.email();

    final error = sut.validate(value: email);

    expect(error, null);
  });

  test('Should return error if email is invalid', () {
    final email = 'kevin.koborigmail.com';

    final error = sut.validate(value: email);

    expect(error, 'Invalid field');
  });
}
