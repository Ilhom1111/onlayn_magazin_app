import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocs/admin_menu_bloc/users_carts_bloc.dart';
import 'blocs/categories_bloc/categories_bloc.dart';
import 'blocs/category_bloc/category_bloc.dart';
import 'blocs/one_product/one_product_bloc.dart';
import 'blocs/products_bloc/products_bloc.dart';
import 'blocs/users_bloc/users_bloc.dart';
import 'pages/product_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductsBloc>(create: (_) => ProductsBloc()),
            BlocProvider<OneProductBloc>(create: (_) => OneProductBloc()),
            BlocProvider<CategoriesBloc>(create: (_) => CategoriesBloc()),
            BlocProvider<CategoryBloc>(create: (_) => CategoryBloc()),
            BlocProvider<UsersCartsBloc>(create: (_) => UsersCartsBloc()),
            BlocProvider<UsersBloc>(create: (_) => UsersBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Onlayn Magazin',
            theme: ThemeData(
              primarySwatch: Colors.grey,
              useMaterial3: false,
            ),
            home: child,
          ),
        );
      },
      child: const HomePage(),
    );
  }
}
