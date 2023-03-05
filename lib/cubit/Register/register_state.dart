part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSuccessState extends RegisterState{}
class RegisterFailureState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}