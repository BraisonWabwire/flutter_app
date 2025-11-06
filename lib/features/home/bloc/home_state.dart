part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

// 1. Build States
// 2. Actionable States
class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState extends HomeState{}
class HomeErrorState extends HomeState{}
class HomeNavigateToWishListPageActioState extends HomeActionState{}
class HomeNavigateToCartPageActioState extends HomeActionState{}