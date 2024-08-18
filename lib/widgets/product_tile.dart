// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterbloc/data/cartdata.dart';
import 'package:flutterbloc/data/wishlistdata.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutterbloc/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc/models/productmodel.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homebloc;
  const ProductTileWidget({
    Key? key,
    required this.productDataModel,
    required this.homebloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInWishlist =
        wishlistitems.any((item) => item.id == productDataModel.id);

    bool isInCart = cartitems.any((item) => item.id == productDataModel.id);

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 16, 16, 16)
                .withOpacity(0.2), // Semi-transparent black
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(productDataModel.imageurl))),
          ),
          Row(
            children: [
              Text(
                productDataModel.name,
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              StarRating(
                rating: productDataModel.rating,
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productDataModel.description,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black45),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${productDataModel.price.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(WishBtnClickEvent(
                              clickedproduct: productDataModel));
                        },
                        icon: Icon(
                          isInWishlist ? Icons.favorite : Icons.favorite_border,
                          color: isInWishlist
                              ? const Color.fromARGB(255, 247, 81, 69)
                              : Colors.black54,
                          size: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(CartBtnClickEvent(
                              clickedproduct: productDataModel));
                        },
                        icon: Icon(
                          isInCart
                              ? Icons.shopping_bag
                              : Icons.shopping_bag_outlined,
                          color: isInCart ? Colors.black54 : Colors.black54,
                          size: 32,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
