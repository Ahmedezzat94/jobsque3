part of 'complete_profile_cubit.dart';

@immutable
abstract class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}


class ProfileCompleted extends CompleteProfileState {}
class ProfileNotCompleted extends CompleteProfileState {}

class OnStepVerify extends CompleteProfileState{}

class BoxChecked extends CompleteProfileState{}
