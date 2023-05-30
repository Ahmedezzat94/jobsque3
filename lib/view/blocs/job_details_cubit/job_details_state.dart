part of 'job_details_cubit.dart';

@immutable
abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class ToggelButtonIncrement extends JobDetailsState {}

class PageJobApplyInitial extends JobDetailsState{}


class PageScroller extends JobDetailsState {}
class FieldIsEmpty extends JobDetailsState{}
class FieldIsNotEmpty extends JobDetailsState{}

class IsSelected extends JobDetailsState{}

class iSLoading extends JobDetailsState{}
class isNotLoading extends JobDetailsState{}
class uploadSuccess extends JobDetailsState{}



