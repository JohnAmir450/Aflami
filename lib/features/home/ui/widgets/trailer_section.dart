import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_alret_dialog.dart';
import 'package:aflami/features/home/logic/trailer_cubit/trailer_cubit.dart';
import 'package:aflami/features/home/ui/widgets/trailer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrailerSection extends StatelessWidget {
  const TrailerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Trailer :',
          style: TextStyles.font26WhiteBold.copyWith(fontSize: 20),
        ),
        BlocBuilder<TrailerCubit, TrailerState>(
          builder: (context, state) {
            if (state is TrailerLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TrailerFailureState) {
              return CustomAlertDialog(
                error: 'state.errorMessage',
                onPressed: () {
                  context.pushReplacementNamed(Routes.homeScreen);
                },
              );
            } else if (state is TrailerSuccessState) {
              return TrailerItem(
                trailer: state.trailerModel.results![0],
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}