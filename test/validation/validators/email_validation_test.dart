import 'package:for_dev/validation/dependencies/field_validation.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation({this.field});

  @override
  String validate({String value}) {
    return null;
  }
}

void main() {
  test('Should return null if email is empty', () {
    final sut = EmailValidation();

    final error = sut.validate(value: '');

    expect(error, null);
  });

   test('Should return null if email is null', () {
    final sut = EmailValidation();

    final error = sut.validate(value: null);

    expect(error, null);
  });
}
