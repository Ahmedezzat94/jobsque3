part of 'suggested_job_cubit.dart';

@immutable
abstract class SuggestedJobState {}

class SuggestedJobInitial extends SuggestedJobState {}
class GetSuggestedJobIsLoading extends SuggestedJobState {}


class GetSuggestedJobSuccess extends SuggestedJobState {
 static List<SuggestedJob>? suggestedjobs ;
 GetSuggestedJobSuccess(List<SuggestedJob>? jobs){
   suggestedjobs = jobs;
 }

}
class GetSuggestedJobFailed extends SuggestedJobState {}
