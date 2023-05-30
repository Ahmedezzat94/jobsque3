part of 'two_step_verification_cubit.dart';

@immutable
abstract class TwoStepVerificationState {}


class TwoStepVerificationInitial extends TwoStepVerificationState {}
class TwoStepVerificationTrue extends TwoStepVerificationState {}
class TwoStepVerificationFalse extends TwoStepVerificationState {}

