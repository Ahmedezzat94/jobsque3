part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}


class ProfileInitial extends ProfileState {}
class ProfileSuccess extends ProfileState {}
class ProfileFailed extends ProfileState {}

class NameIsLoading extends ProfileState {}
class InitialName extends ProfileState {}

