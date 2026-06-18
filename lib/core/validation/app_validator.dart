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

    if (value.length <= 7) {
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

  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    // if (value.trim().length < 3) {
    //   return 'Name must be at least 3 characters';
    // }
    final nameRegex = RegExp(r'^[a-zA-Zأ-ي\s]+$');

    if (!nameRegex.hasMatch(value.trim())) {
      return 'Name must contain letters only';
    }

    return null;
  }
static String? validateDateOfBirth(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Date of birth is required';
  }
  final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!dateRegex.hasMatch(value.trim())) {
    return 'Format must be MM/DD/YYYY';
  }
  final parts = value.split('/');
  final month = int.tryParse(parts[0]);
  final day = int.tryParse(parts[1]);
  final year = int.tryParse(parts[2]);

  if (month == null || month < 1 || month > 12) {
    return 'Invalid month';
  }
  if (day == null || day < 1 || day > 31) {
    return 'Invalid day';
  }
  if (year == null || year < 1900 || year > DateTime.now().year) {
    return 'Invalid year';
  }
  final dob = DateTime.tryParse(
    '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}',
  );
  if (dob == null) {
    return 'Invalid date';
  }
  if (DateTime.now().difference(dob).inDays < 365) {
    return 'Age must be at least 1 year';
  }
  return null;
}

static String? validatePhoneNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number is required';
  }
  final digits = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
  if (!RegExp(r'^\+?\d+$').hasMatch(digits)) {
    return 'Phone number must contain digits only';
  }
  if (digits.length < 7 || digits.length > 15) {
    return 'Invalid phone number';
  }
  return null;
}

static String? validateEmailOptional(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  return validateEmail(value);
}

static String? validateCity(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'City is required';
  }
  return null;
}

static String? validateAddress(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Address is required';
  }
  if (value.trim().length < 5) {
    return 'Please enter a full address';
  }
  return null;
}

static String? validateRelationship(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please select a relationship';
  }
  const allowed = ['Spouse', 'Parent', 'Child', 'Friend', 'Other'];
  if (!allowed.contains(value)) {
    return 'Invalid value';
  }
  return null;
}

static String? validateAllergies(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  if (value.trim().length > 300) {
    return 'Text is too long (max 300 characters)';
  }
  return null;
}

static String? validateChronicConditions(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  if (value.trim().length > 300) {
    return 'Text is too long (max 300 characters)';
  }
  return null;
}

static String? validateHeight(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Height is required';
  }
  final height = double.tryParse(value.trim());
  if (height == null) {
    return 'Please enter a valid number';
  }
  if (height < 50 || height > 250) {
    return 'Enter a valid height (50–250 cm)';
  }
  return null;
}

static String? validateWeight(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Weight is required';
  }
  final weight = double.tryParse(value.trim());
  if (weight == null) {
    return 'Please enter a valid number';
  }
  if (weight < 2 || weight > 500) {
    return 'Enter a valid weight (2–500 kg)';
  }
  return null;
}

static String? validateBloodPressureSystolic(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Systolic blood pressure is required';
  }
  final bp = int.tryParse(value.trim());
  if (bp == null) {
    return 'Please enter a valid number';
  }
  if (bp < 50 || bp > 300) {
    return 'Value must be between 50 and 300 mmHg';
  }
  return null;
}

static String? validateBloodPressureDiastolic(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Diastolic blood pressure is required';
  }
  final bp = int.tryParse(value.trim());
  if (bp == null) {
    return 'Please enter a valid number';
  }
  if (bp < 30 || bp > 200) {
    return 'Value must be between 30 and 200 mmHg';
  }
  return null;
}
  
}
