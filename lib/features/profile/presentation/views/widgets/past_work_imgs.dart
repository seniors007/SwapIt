import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:swapit/features/profile/presentation/views/widgets/custom_profile_img.dart';
import '../../../../../core/user_controller.dart';
import '../../../data/models/images_model/images_model.dart';
import '../../manager/images_cubit/images_cubit.dart';

class PastWorkImgs extends StatelessWidget {
  const PastWorkImgs({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return BlocProvider(
      create: (context) =>
          ImagesCubit(Dio())..fetchImages(userController.userId.value),
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          if (state is ImagesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ImagesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  ..._buildImageRows(state.images, context),
                ],
              ),
            );
          } else if (state is ImagesFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  List<Widget> _buildImageRows(List<ImagesModel> images, BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < images.length; i += 2) {
      rows.add(
        Row(
          children: [
            CustomProfileImage(
              base64Image: images[i].base64Image,
              contentType: images[i].contentType,
            ),
            const SizedBox(width: 10),
            if (i + 1 < images.length)
              CustomProfileImage(
                base64Image: images[i + 1].base64Image,
                contentType: images[i + 1].contentType,
              ),
          ],
        ),
      );
      rows.add(const SizedBox(height: 10));
    }
    return rows;
  }
}
