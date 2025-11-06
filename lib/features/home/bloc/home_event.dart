part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent{}

class HomeProductCartButtonClickedEvent extends HomeEvent{}

class HomeWishListButtonNavigateClickedEvent extends HomeEvent{}

class HomeCartButtonNavigateClickedEvent extends HomeEvent{}


