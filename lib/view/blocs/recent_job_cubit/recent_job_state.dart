part of 'recent_job_cubit.dart';

@immutable
abstract class RecentJobState {}

class RecentInitial extends RecentJobState {}

class GetRecentJobIsLoading extends RecentJobState {}

class GetRecentJobSuccess extends RecentJobState {
  static List<RecentJob>? recentjobs ;
  GetRecentJobSuccess(List<RecentJob>? jobs){
    recentjobs = jobs ;
  }

}
class GetRecentJobFailed extends RecentJobState {}

