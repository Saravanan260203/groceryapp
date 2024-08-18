// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class WishBtnClickEvent extends HomeEvent {
  final ProductDataModel clickedproduct;
  WishBtnClickEvent({
    required this.clickedproduct,
  });
  
}

class CartBtnClickEvent extends HomeEvent {
  final ProductDataModel clickedproduct;
  CartBtnClickEvent({
    required this.clickedproduct,
  });
}

class NavigateWishBtnClickEvent extends HomeEvent {}

class NavigateCartBtnClickEvent extends HomeEvent {}
