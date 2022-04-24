part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object?> get props => [];
}


class UserInitial extends UserState {}

class UserLoading extends UserState {}

// * User Authenticated State
class UserAuthenticated extends UserState {

  final User user;
  final firebaseAuth.UserCredential? userCredential;

  const UserAuthenticated({
    required this.user,
    required this.userCredential,
  });
  
  @override
  List<Object?> get props => [user, userCredential];

}


// * User Unauthenticated
class UserUnauthenticated extends UserState {}


class UserError extends UserState {}