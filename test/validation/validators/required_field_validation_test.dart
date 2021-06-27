import 'package:test/test.dart';

import 'package:for_dev/validation/validators/validators.dart';

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation(field: 'any_field');
  });
  test('Should return null if value is not empty', () {
    final error = sut.validate('any_value');

    expect(error, null);
  });

  test('Should return error if value is empty', () {
    final error = sut.validate('');

    expect(error, 'Required field');
  });

  test('Should return error if value is empty', () {
    final error = sut.validate(null);

    expect(error, 'Required field');
  });
}
