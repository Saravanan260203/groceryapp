import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/features/cart/view/cart.dart';
import 'package:flutterbloc/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc/features/wishlist/view/wishlist.dart';
import 'package:flutterbloc/widgets/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateWishlistState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeNavigateCartState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is productCarted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Product Added to Cart \u{1F6CD}',
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: const Color.fromARGB(255, 85, 85, 85),
            ),
          );
        } else if (state is productWishlisted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Product Added to Wishlist ❤',
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: const Color.fromARGB(255, 85, 85, 85),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              'Grocery App',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(NavigateWishBtnClickEvent());
                },
                icon: Icon(Icons.favorite_border, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(NavigateCartBtnClickEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
              ),
            ],
          ),
          body: state is HomeLoadingState
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    itemCount: 10, // Adjust the number of items as needed
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
                          ),
                          Row(
                            children: [
                              Text(
                                'dkdkdk',
                                style: GoogleFonts.poppins(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'dfghjkl',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.black45),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'xxx',
                                    style: GoogleFonts.poppins(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.black54,
                                          size: 32,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Colors.black54,
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
                    ),
                  ),
                )
              : state is HomeDataSuccessState
                  ? ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductTileWidget(
                            homebloc: HomeBloc(),
                            productDataModel: state.products[index]);
                      },
                    )
                  : Center(child: Text('Something Wrong')),
          bottomNavigationBar: BottomAppBar(
            height: 60,
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Handle home button press
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    // Handle search button press
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    // Handle notifications button press
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    // Handle account button press
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
