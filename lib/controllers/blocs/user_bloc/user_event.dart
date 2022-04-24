part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}


class SetUser extends UserEvent {

  final User user;
  final firebaseAuth.UserCredential? userCredential;

  const SetUser({
    required this.user,
    required this.userCredential
  });

  @override
  List<Object?> get props => [user, userCredential];

}


class UnsetUser extends UserEvent {}


class LoadUser extends UserEvent {}


class SetUserError extends UserEvent {

  final String? errorMessage;

  const SetUserError({
    required this.errorMessage
  });

  @override
  List<Object?> get props => [errorMessage];

}
