import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/cartdata.dart';
import 'package:flutterbloc/data/grocerydata.dart';
import 'package:flutterbloc/data/wishlistdata.dart';
import 'package:flutterbloc/models/productmodel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<WishBtnClickEvent>(wishBtnClickEvent);
    on<CartBtnClickEvent>(cartBtnClickEvent);

    on<NavigateWishBtnClickEvent>(navigateWishBtnClickEvent);
    on<NavigateCartBtnClickEvent>(navigateCartBtnClickEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeDataSuccessState(
        products: GroceryData.groceryData
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                rating: e['rating'],
                description: e['description'],
                price: e['price'],
                imageurl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> navigateCartBtnClickEvent(
      NavigateCartBtnClickEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateCartState());
  }

  FutureOr<void> navigateWishBtnClickEvent(
      NavigateWishBtnClickEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateWishlistState());
  }

  FutureOr<void> cartBtnClickEvent(
      CartBtnClickEvent event, Emitter<HomeState> emit) {
    cartitems.add(event.clickedproduct);
    emit(productCarted(event.clickedproduct));
    emit(HomeDataSuccessState(
        products: GroceryData.groceryData
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                rating: e['rating'],
                description: e['description'],
                price: e['price'],
                imageurl: e['imageUrl']))
            .toList()));
    // print('cartbtn cliked');
  }

  FutureOr<void> wishBtnClickEvent(
      WishBtnClickEvent event, Emitter<HomeState> emit) {
    wishlistitems.add(event.clickedproduct);
    emit(productWishlisted(event.clickedproduct));
    emit(HomeDataSuccessState(
        products: GroceryData.groceryData
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                rating: e['rating'],
                description: e['description'],
                price: e['price'],
                imageurl: e['imageUrl']))
            .toList()));
  }
}
