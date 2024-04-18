final String customerTable = 'customerTable';
class CustomerFields {
  static final List<String> values = [
    /// Add all fields
    id, firstName, lastName, password, mobileNumber, emailAddress, gender, designation
  ];

  static final String id = '_id';
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String password = 'password';
  static final String mobileNumber = 'mobileNumber';
  static final String emailAddress = 'emailAddress';
  static final String gender = 'gender';
  static final String designation = 'designation';
}

class Customer {
  final int? id;
  final String firstName;
  final String lastName;
  final String password;
  final String mobileNumber;
  final String emailAddress;
  final String gender;
  final String designation;

  const Customer({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.mobileNumber,
    required this.emailAddress,
    required this.gender,
    required this.designation,

  });

  Customer copy({
    int? id,
    String? firstName,
    String? lastName,
    String? password,
    String? mobileNumber,
    String? emailAddress,
    String? gender,
    String? designation
  }) =>
      Customer(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        emailAddress: emailAddress ?? this.emailAddress,
        gender: gender ?? this.gender,
        designation: designation ?? this.designation,
      );

  static Customer fromJson(Map<String, Object?> json) => Customer(
    id: json[CustomerFields.id] as int?,
    firstName: json[CustomerFields.firstName] as String,
    lastName: json[CustomerFields.lastName] as String,
    password: json[CustomerFields.password] as String,
    mobileNumber: json[CustomerFields.mobileNumber] as String,
    emailAddress: json[CustomerFields.emailAddress] as String,
    gender: json[CustomerFields.gender] as String,
    designation: json[CustomerFields.designation] as String,

  );

  Map<String, Object?> toJson() => {
    CustomerFields.id: id,
    CustomerFields.firstName: firstName,
    CustomerFields.lastName: lastName,
    CustomerFields.password: password,
    CustomerFields.mobileNumber: mobileNumber,
    CustomerFields.emailAddress: emailAddress,
    CustomerFields.gender: gender,
    CustomerFields.designation: designation,
  };
}