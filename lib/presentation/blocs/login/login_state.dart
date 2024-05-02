part of 'login_cubit.dart';

enum FormStatus {
  invalid,
  valid,
  validating,
  posting,
  submissionSuccess,
  submissionFailure
}

class LoginFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final LUsername username;
  final LPassword password;

  const LoginFormState({
      this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const LUsername.pure(),
      this.password = const LPassword.pure(),
    });

  LoginFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    LUsername? username,
    LPassword? password,
  }) => LoginFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  List<Object> get props => [
    formStatus,
    isValid,
    username,
    password,
  ];
}
