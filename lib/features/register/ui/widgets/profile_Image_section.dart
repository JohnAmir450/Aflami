import 'dart:io';

import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/features/register/logic/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var pickedImage =context.read<RegisterCubit>().pickedImage;
        return Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.mainPurple,
                radius: 85.r,
                child:pickedImage!=null?  CircleAvatar(
                  radius: 80.r,
                  backgroundImage:
                       FileImage(File(pickedImage.path))
                )
              :CircleAvatar(
                  radius: 80.r,
                  backgroundImage:
                       const AssetImage('assets/images/profile 7.png'),
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.read<RegisterCubit>().pickProfileImage();
                  },
                  icon: const CircleAvatar(
                      backgroundColor: ColorsManager.mainPurple,
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.grey,
                      )))
            ],
          ),
        );
      },
    );
  }
}
