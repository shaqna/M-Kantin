import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mkantin/presentation/pages/home/bloc/food_bloc.dart';
import 'package:mkantin/presentation/widgets/food_card.dart';
import 'package:mkantin/utils/category.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _itemsCategory = [
    Category.all,
    Category.fitters,
    Category.rice,
  ];
  var currentCategory = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<FoodBloc>().add(OnFetchFoodList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.red,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_open,
                color: Colors.red,
                size: 30,
              ));
        }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.red,
                size: 30,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('checkout_page',
              pathParameters: {'username': widget.username});
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.shopping_cart_checkout),
      ),
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.red.withOpacity(0.5)),
        child: Drawer(
          child: Container(
            margin: const EdgeInsets.all(12.0),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    'm-Kantin',
                    style: GoogleFonts.poppins(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Food Court\nMenara Satu Plaza',
                    style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Halo, ${widget.username}',
                    style: GoogleFonts.poppins(
                        fontSize: 18.0, color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    minLeadingWidth: 10.0,
                    title: Text(
                      'Home / Order',
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    leading: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    minLeadingWidth: 10.0,
                    title: Text(
                      'Order History',
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    leading: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    minLeadingWidth: 10.0,
                    title: Text(
                      'Item Settings',
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    leading: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    minLeadingWidth: 10.0,
                    title: Text(
                      'Category Settings',
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    leading: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    minLeadingWidth: 10.0,
                    title: Text(
                      'Profile Settings',
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    leading: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.goNamed('login_page');
                    },
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/baner_resto.jpg',
            fit: BoxFit.fitWidth,
            height: 100,
            width: double.infinity,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _itemsCategory.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<FoodBloc>().add(OnFetchFoodList());
                      setState(() {
                        currentCategory = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                          color: currentCategory == index
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Expanded(
                        child: Center(
                            child: Text(
                          _itemsCategory[index],
                          style: GoogleFonts.poppins(),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 12.0,
          ),
          BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodLoading) {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              } else if (state is FoodError) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    child: const Center(
                      child: Text('Something wrong'),
                    ));
              } else if (state is FoodHasData) {
                var foodList = state.foodList;
                if (_itemsCategory[currentCategory] == Category.fitters) {
                  foodList.removeWhere(
                      (element) => element.category != Category.fitters);
                } else if (_itemsCategory[currentCategory] == Category.rice) {
                  foodList.removeWhere(
                      (element) => element.category != Category.rice);
                } else if (_itemsCategory[currentCategory] == Category.all) {
                  foodList = state.foodList;
                }
                print(foodList);
                return Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(8),
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                        children: List.generate(foodList.length, (index) {
                          return FoodCard(
                              food: foodList[index], username: widget.username);
                        }),
                      )),
                );
              } else {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
