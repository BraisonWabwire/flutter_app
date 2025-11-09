import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/data/grocery_data.dart';
import 'package:flutter_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
      homeProductWishListButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e["id"],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                imagegUrl: e["imagegUrl"],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
    HomeProductWishListButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist product clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart product clicked");
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
    HomeWishListButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist Navigate clicked");
    emit(HomeNavigateToWishListPageActionState());
  }
}

FutureOr<void> homeCartButtonNavigateEvent(
  HomeCartButtonNavigateEvent event,
  Emitter<HomeState> emit,
) {
  print("Cart Navigate clicked");
  emit(HomeNavigateToCartPageActionState());
}
