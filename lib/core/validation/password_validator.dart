class PasswordValidator {
  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasTwoNumbers;

  const PasswordValidator({
    this.hasMinLength = false,
    this.hasUppercase = false,
    this.hasTwoNumbers = false,
  });
  bool get isValid => hasMinLength && hasUppercase && hasTwoNumbers;
}
