part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}


class SetUser extends UserEvent {

  final UserCredential userCredential;

  const SetUser({
    required this.userCredential
  });

  @override
  List<Object> get props => [userCredential];

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
