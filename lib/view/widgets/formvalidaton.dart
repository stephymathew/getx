

class FormValidation {
  
  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a user name';
    }
    return null;
  }

  static String? validateRegisterNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the register number';
    } else if (value.length != 5) {
      return 'Enter a valid register number';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }
}
