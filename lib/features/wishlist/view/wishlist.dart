import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutterbloc/widgets/wish_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistbloc = WishlistBloc();
  @override
  void initState() {
    wishlistbloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistbloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WishlistLoadingState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text(
                'Wishlist Items',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 10, // Number of shimmer items
                itemBuilder: (context, index) => Container(
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
                        height: 200,
                        width: double.maxFinite,
                        color: Colors.grey, // Placeholder color
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 150,
                        color: Colors.grey, // Placeholder for text
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 100,
                        color: Colors.grey, // Placeholder for text
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: 80,
                            color: Colors.grey, // Placeholder for price
                          ),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                color: Colors.grey, // Placeholder for icon
                              ),
                              SizedBox(width: 8),
                              Container(
                                height: 32,
                                width: 32,
                                color: Colors.grey, // Placeholder for icon
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is WishlistSuccessState) {
          if (state.wishlistitems.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  'Wishlist Items',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: Text(
                  'No Products in Wishlist',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  'Wishlist Items',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: ListView.builder(
                itemCount: state.wishlistitems.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    wishlistBloc: wishlistbloc,
                    productDataModel: state.wishlistitems[index],
                  );
                },
              ),
            );
          }
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text(
                'Wishlist Items',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      },
    );
  }
}
