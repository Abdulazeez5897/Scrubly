// ignore_for_file: constant_identifier_names

enum UserRole {
  applicant,
  specialist;

  static UserRole fromString(String value) {
    switch (value.toLowerCase()) {
      case 'applicant':
        return UserRole.applicant;
      case 'specialist':
        return UserRole.specialist;
      default:
        // Default to applicant if unknown
        return UserRole.applicant;
    }
  }

  String get value {
    switch (this) {
      case UserRole.applicant:
        return 'applicant';
      case UserRole.specialist:
        return 'specialist';
    }
  }
}
