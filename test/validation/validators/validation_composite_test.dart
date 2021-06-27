import 'dart:math';

import 'package:for_dev/validation/dependencies/field_validation.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:for_dev/presentation/dependencies/dependencies.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite({this.validations});

  @override
  String validate({@required String field, @required String value}) {
    return null;
  }
}

class FieldValidationSpy extends Mock implements FieldValidation {}

void main() {
  test('Should  return null if all validation returns null or empty', () {
    final validation1 = FieldValidationSpy();
    when(validation1.field).thenReturn('any_field');
    when(validation1.validate()).thenReturn(null);
    final validation2 = FieldValidationSpy();
    when(validation2.field).thenReturn('any_field');
    when(validation2.validate()).thenReturn('');
    final sut = ValidationComposite(validations: [validation1, validation2]);
    
    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}
