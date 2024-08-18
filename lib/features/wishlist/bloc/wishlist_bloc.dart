import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/wishlistdata.dart';
import 'package:flutterbloc/models/productmodel.dart';
import 'package:meta/meta.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  Future<FutureOr<void>> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    print(wishlistitems);

    emit(WishlistSuccessState(wishlistitems: wishlistitems));
  }
}
