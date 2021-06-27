import 'package:test/test.dart';

abstract class FieldValidation {
  String get field;
  String validate({String value});
}

class RequiredFieldValidation implements FieldValidation {
  final String field;

  RequiredFieldValidation({this.field});

  String validate({String value}) {
    return value.isEmpty ? 'Required field' : null;
  }
}

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation(field: 'any_field');
  });
  test('Should return null if value is not empty', () {
    final error = sut.validate(value: 'any_value');

    expect(error, null);
  });

  test('Should return error if value is empty', () {
    final error = sut.validate(value: '');

    expect(error, 'Required field');
  });
}
