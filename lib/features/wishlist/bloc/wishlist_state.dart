part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistitems;
  WishlistSuccessState({
    required this.wishlistitems,
  });
}
