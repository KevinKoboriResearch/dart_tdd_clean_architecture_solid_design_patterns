import 'package:test/test.dart';

import 'package:for_dev/main/factories/factories.dart';
import 'package:for_dev/validation/validators/validators.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeLoginValidations();

    expect(validations, [
      RequiredFieldValidation(field: 'email'),
      EmailValidation(field: 'email'),
      RequiredFieldValidation(field: 'password')
    ]);
  });
}
