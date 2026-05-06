class AppValidator {
  AppValidator._();
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    value = value.trim();

    if (!value.contains('@')) {
      return 'Email must contain @ symbol';
    }
    final parts = value.split('@');

    if (parts.length != 2) {
      return 'Invalid email format';
    }

    final local = parts[0];
    final domain = parts[1];

    if (local.isEmpty) {
      return 'Missing username before @';
    }

    if (local.length < 2) {
      return 'Username is too short';
    }

    if (domain.isEmpty) {
      return 'Missing domain after @';
    }
    if (!domain.contains('.')) {
      return 'Domain must contain a dot (e.g. gmail.com)';
    }

    final domainParts = domain.split('.');

    if (domainParts.any((part) => part.isEmpty)) {
      return 'Invalid domain format';
    }

    final tld = domainParts.last;

    if (tld.length < 2) {
      return 'Domain extension is too short';
    }

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regex.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is requiered!';
    }

    if (value.length <= 8) {
      return 'password is too short!';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'password must contain at least one upper case later';
    }

    int digitCount = value.replaceAll(RegExp(r'[^0-9]'), '').length;
    if (digitCount < 2) {
      return 'password must have two numbers at least';
    }
    return null;
  }
}
