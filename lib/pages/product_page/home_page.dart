import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlayn_magazin_app/models/products_model/products_model.dart';
import 'package:onlayn_magazin_app/pages/cart_page/cart_page.dart';

import '../../blocs/products_bloc/products_bloc.dart';
import '../../constants/colors.dart';
import '../../services/hive_service.dart';
import '../../views/exit_alert_dialog.dart';
import '../../views/loading/loading.dart';
import '../admin_page/users_carts_page.dart';
import 'categories_page.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductsModel>? products;

  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(const ProductsParsEvent());
  }

  void cart() {
    if (HiveService.myCart.values.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("The cart is empty!."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double gridY = MediaQuery.sizeOf(context).height / 3;
    return WillPopScope(
      onWillPop: () async {
        final value = await showAdaptiveDialog(
          barrierColor: Colors.black.withOpacity(.3),
          context: context,
          builder: (context) {
            return ExitAlertDialog(
              onYpressed: () => Navigator.of(context).pop(false),
              onHpressed: () => Navigator.of(context).pop(true),
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.ff192a3a,
          title: Text(
            "Onlayn Magazin",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
            ),
          ),
          centerTitle: true,
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersCartsPage(),
                  ),
                );
              },
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          leadingWidth: 100.w,
          actions: [
            GestureDetector(
              onTap: cart,
              child: SizedBox(
                width: 45.w,
                height: 45.w,
                child: const Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<ProductsBloc, ProductsState>(
              listener: (context, state) async {
                if (state is ProductsFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }

                if (state is CreateProductsSuccess) {
                  products = state.products;
                }
              },
            ),
          ],
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Loading();
              } else {
                if (products != null) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: GridView.builder(
                      itemCount: products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: gridY,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = products![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: CustomColors.ff192a3a),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: CachedNetworkImage(
                                    imageUrl: product.image,
                                    fit: BoxFit.fitHeight,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.title,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                          ),
                                          const Spacer(flex: 2),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 45.w,
                                                height: 19.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 18.sp,
                                                      color: Colors.amber,
                                                    ),
                                                    Text(
                                                      "${product.rating.rate}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "\$${product.price},",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(flex: 1),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }
            },
          ),
        ),
        floatingActionButton: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: CustomColors.ff192a3a),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesPage(),
              ),
            );
          },
          child: const Text(
            'Categories',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
