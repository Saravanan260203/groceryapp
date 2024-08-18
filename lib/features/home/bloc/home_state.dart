part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeDataSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeDataSuccessState({required this.products});
}

final class HomeDataErrorState extends HomeState {}

final class HomeNavigateWishlistState extends HomeActionState {}

final class HomeNavigateCartState extends HomeActionState {}

final class productCarted extends HomeActionState {
  final ProductDataModel cartedproduct;

  productCarted(this.cartedproduct);
}

final class productWishlisted extends HomeActionState {
  final ProductDataModel wishedproduct;

  productWishlisted(this.wishedproduct);
}
