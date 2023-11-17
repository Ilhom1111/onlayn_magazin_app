import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlayn_magazin_app/pages/admin_page/users_page.dart';

import '../../blocs/admin_menu_bloc/users_carts_bloc.dart';
import '../../constants/colors.dart';
import '../../models/carts_model/cart_model.dart';
import '../../views/loading/loading.dart';

class UsersCartsPage extends StatefulWidget {
  const UsersCartsPage({super.key});

  @override
  State<UsersCartsPage> createState() => _UsersCartsPageState();
}

class _UsersCartsPageState extends State<UsersCartsPage> {
  List<CartModel>? usersCarts;

  @override
  void initState() {
    context.read<UsersCartsBloc>().add(const UsersCartsParsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.ff192a3a,
        title: const Text(
          'Users Carts',
          style: TextStyle(
            color: Colors.white,
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
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UsersPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UsersCartsBloc, UsersCartsState>(
            listener: (context, state) async {
              if (state is UsersCartsFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is CreateUsersCartsSuccess) {
                usersCarts = state.usersCarts;
              }
            },
          ),
        ],
        child: BlocBuilder<UsersCartsBloc, UsersCartsState>(
          builder: (context, state) {
            if (state is UsersCartsLoading) {
              return const Loading();
            } else {
              if (usersCarts != null) {
                return ListView.builder(
                  itemCount: usersCarts!.length,
                  itemBuilder: (context, index) {
                    final userCart = usersCarts![index];
                    DateTime d = DateTime.parse(userCart.date);
                    String data = "${d.year}-0${d.month}-0${d.day}";

                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 10, left: 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: CustomColors.ff192a3a),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'User Id: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: userCart.userId.toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Cart items count: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: userCart.products.length.toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            for (int i = 0; i < userCart.products.length; i++)
                              Text(
                                'Product Id: ${userCart.products[i].productId} = Quantity: ${userCart.products[i].quantity}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            SizedBox(height: 15.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Date: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            }
          },
        ),
      ),
    );
  }
}
