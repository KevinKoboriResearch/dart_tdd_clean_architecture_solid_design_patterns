import '../../../../main/builders/builders.dart';
import '../../../../presentation/dependencies/dependencies.dart';
import '../../../../validation/dependencies/dependencies.dart';
import '../../../../validation/validators/validators.dart';

Validation makeLoginValidation() =>
    ValidationComposite(validations: makeLoginValidations());

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
