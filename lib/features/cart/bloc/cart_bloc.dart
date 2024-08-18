import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/cartdata.dart';
import 'package:flutterbloc/models/productmodel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  Future<FutureOr<void>> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    emit(CartSuccessState(cartitems: cartitems));
  }
}
