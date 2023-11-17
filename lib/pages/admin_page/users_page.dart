import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlayn_magazin_app/models/user_model/user_model.dart';

import '../../blocs/users_bloc/users_bloc.dart';
import '../../constants/colors.dart';
import '../../views/loading/loading.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel>? users;

  @override
  void initState() {
    context.read<UsersBloc>().add(const UsersParsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.ff192a3a,
        title: const Text(
          'Users',
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
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UsersBloc, UsersState>(
            listener: (context, state) async {
              if (state is UsersFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is CreateUsersSuccess) {
                users = state.users;
              }
            },
          ),
        ],
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Loading();
            } else {
              if (users != null) {
                return ListView.builder(
                  itemCount: users!.length,
                  itemBuilder: (context, index) {
                    final user = users![index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: CustomColors.ff192a3a,
                            child: Text(
                              user.username[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          title: Text(
                            user.username,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(user.email),
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
