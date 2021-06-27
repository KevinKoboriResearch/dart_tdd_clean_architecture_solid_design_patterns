import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'package:for_dev/validation/dependencies/field_validation.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation({@required this.field});

  @override
  String validate({String value}) {
    return null;
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
}
