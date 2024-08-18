import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/features/cart/bloc/cart_bloc.dart';
import 'package:flutterbloc/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc/features/home/view/home.dart';
import 'package:flutterbloc/features/wishlist/bloc/wishlist_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => CartBloc(),
        ),
        BlocProvider(create: (_) => WishlistBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
