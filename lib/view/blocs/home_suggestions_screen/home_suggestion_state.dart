part of 'home_suggestion_cubit.dart';

@immutable
abstract class HomeSuggestionState {}

class HomeSuggestionInitial extends HomeSuggestionState {}


class HomeSuggestionLoading extends HomeSuggestionState {}
class HomeSuggestionSuccess extends HomeSuggestionState {
  static List<RecentJob>? searchJobs =[];
  HomeSuggestionSuccess(List<RecentJob>? jobs){
    searchJobs = jobs ;
  }
}
class HomeSuggestionError extends HomeSuggestionState {}