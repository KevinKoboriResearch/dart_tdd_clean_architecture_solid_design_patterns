import '../../../../presentation/dependencies/dependencies.dart';
import '../../../../validation/dependencies/dependencies.dart';
import '../../../../validation/validators/validators.dart';

Validation makeLoginValidation() =>
    ValidationComposite(validations: makeLoginValidations());

List<FieldValidation> makeLoginValidations() => [
      RequiredFieldValidation(field: 'email'),
      EmailValidation(field: 'email'),
      RequiredFieldValidation(field: 'password')
    ];
