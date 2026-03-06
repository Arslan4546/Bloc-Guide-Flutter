class Validations {
  static bool emailValidation(String email) {
    bool result = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    return result;
  }
}
