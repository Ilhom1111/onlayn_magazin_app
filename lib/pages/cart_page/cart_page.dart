import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlayn_magazin_app/models/hive_cart_model/hive_cart_model.dart';

import '../../constants/colors.dart';
import '../../services/hive_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> counts = [];

  void addCount({
    required int index,
    required BuildContext context,
  }) {
    List<HiveCartModel> list = HiveService.myCart.values.toList().cast();
    int? count = int.tryParse(list[index].count);
    int son = count!;

    if (son == 99) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Eng ko'pibilan 99 ta mahsulot olish mimkin."),
        ),
      );
      return;
    } else {
      son++;
      counts[index] = son.toString();
      HiveService.myCart.put(
        HiveService.myCart.keys.toList()[index],
        HiveCartModel(
            title: list[index].title,
            imageUrl: list[index].imageUrl,
            price: list[index].price,
            count: son.toString(),
            id: list[index].id),
      );

      setState(() {});
      log(son.toString());
    }
  }

  void removeCount({
    required int index,
  }) {
    List<HiveCartModel> list = HiveService.myCart.values.toList().cast();
    int? count = int.tryParse(list[index].count);
    int son = count!;

    if (son == 1) {
      return;
    } else {
      son--;
      counts[index] = son.toString();
      HiveService.myCart.put(
        HiveService.myCart.keys.toList()[index],
        HiveCartModel(
            title: list[index].title,
            imageUrl: list[index].imageUrl,
            price: list[index].price,
            count: son.toString(),
            id: list[index].id),
      );

      setState(() {});
      log(son.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<HiveCartModel> carts = HiveService.myCart.values.toList().cast();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.ff192a3a,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) {
          final cart = carts[index];
          counts.add(cart.count);
          return GestureDetector(
            onLongPress: () {
              counts.removeAt(index);
              HiveService.myCart
                  .delete(HiveService.myCart.keys.toList()[index]);
              log('Delete');
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                margin: EdgeInsets.only(top: 15.h),
                width: MediaQuery.sizeOf(context).width,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: CustomColors.ff192a3a),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 75.w,
                      height: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: cart.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 110,
                          child: Text(
                            cart.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(flex: 2),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 110,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 85.w,
                                child: Text(
                                  "\$${cart.price}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 100.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        removeCount(index: index);
                                      },
                                      child: Container(
                                        width: 22,
                                        height: 22,
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.remove,
                                          size: 19,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      counts[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        addCount(
                                            context: context, index: index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 22,
                                        height: 22,
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.add,
                                          size: 19,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
