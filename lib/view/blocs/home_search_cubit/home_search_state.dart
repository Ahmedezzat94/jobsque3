part of 'home_search_cubit.dart';
@immutable
abstract class HomeSearchState {}

class HomeSearchInitial extends HomeSearchState {}

class HomeSearchLoading extends HomeSearchState {}



class HomeSearchGetResult extends HomeSearchState {

  static List<RecentJob>? searchJobs;
  HomeSearchGetResult(List<RecentJob>? searchJob){
    searchJobs = searchJob;
  }
}

class HomeSearchError extends HomeSearchState{}


