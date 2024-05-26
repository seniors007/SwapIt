import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/home/presentation/manager/get_user_cubit/get_user_cubit.dart';
import '../../features/home/data/get_user_model/get_user_model.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetUserCubit>(
      create: (context) => GetUserCubit()..getUser(33),
      child: BlocBuilder<GetUserCubit, GetUserState>(
        builder: (context, state) {
          if (state is GetUserLoading) {
            return const CircularProgressIndicator();
          } else if (state is GetUserSuccess) {
            final user = state.user;
            return _buildProfileWidget(user);
          } else if (state is GetUserFailure) {
            return const Text('Check Your Internet Connection');
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildProfileWidget(GetUserModel user) {
    return Container(
      clipBehavior: Clip.none,
      height: 140,
      width: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey.withOpacity(.50),
            spreadRadius: 0,
            offset: const Offset(10, 19),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/profile.png'),
                  ),
                  Text(
                    user.username,
                    style: TextStyle(color: kGreenColor),
                  ),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/star.png'),
                        height: 20,
                        width: 20,
                      ),
                      Text(
                        "user.rating.toString()",
                        style: const TextStyle(color: kGreenColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.jobTitle,
                    style: const TextStyle(
                      color: kGreenColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/location.png'),
                        height: 20,
                        width: 20,
                      ),
                      Text(
                        "user.location",
                        style: TextStyle(color: kGreenColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
