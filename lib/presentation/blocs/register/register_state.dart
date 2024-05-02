part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting, submissionSuccess, submissionFailure }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Cedula cedula;
  final Nombre nombre;
  final Apellidos apellidos;
  final Telefono telefono;
  final Username username;
  final Password password;
  final ConfirmedPassword confirmedPassword;

  const RegisterFormState({
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.cedula = const Cedula.pure(),
    this.nombre = const Nombre.pure(),
    this.apellidos = const Apellidos.pure(),
    this.telefono = const Telefono.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Cedula? cedula,
    Nombre? nombre,
    Apellidos? apellidos,
    Telefono? telefono,
    Username? username,
    Password? password,
    ConfirmedPassword? confirmedPassword
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        cedula: cedula ?? this.cedula,
        nombre: nombre ?? this.nombre,
        apellidos: apellidos ?? this.apellidos,
        telefono: telefono ?? this.telefono,
        username: username ?? this.username,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      );

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        cedula,
        nombre,
        apellidos,
        telefono,
        username,
        password,
        confirmedPassword,
      ];
}
