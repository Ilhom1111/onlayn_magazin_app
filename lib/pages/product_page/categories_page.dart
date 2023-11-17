import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/categories_bloc/categories_bloc.dart';
import '../../constants/colors.dart';
import '../../views/loading/loading.dart';
import 'category_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    context.read<CategoriesBloc>().add(const CategoriesParsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.ff192a3a,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Categories",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CategoriesBloc, CategoriesState>(
            listener: (context, state) async {
              if (state is CategoriesFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }

              if (state is CreateCategoriesSuccess) {
                categories = state.categories;
              }
            },
          ),
        ],
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Loading();
            } else {
              if (categories.isNotEmpty) {
                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String categ = categories[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 12, left: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.ff192a3a,
                            minimumSize: Size(double.infinity, 60.h)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                category: categ,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          categ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
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
