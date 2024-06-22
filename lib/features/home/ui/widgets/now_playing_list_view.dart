import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_alret_dialog.dart';
import 'package:aflami/features/home/logic/now_playing_cubit/now_playing_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NowPlayingListView extends StatelessWidget {
  final String title;
  const NowPlayingListView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is MoviesNowPlayingSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.font20WhiteSemiBold,
                    ),
                    GestureDetector(
                      onTap: (){
                        context.pushNamed(Routes.showMoreNowPlayingMovies);
                      },
                      child: Text(
                        'Show more',
                        style: TextStyles.font13GreyRegular
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                    
                   
                  ],
                ),
                 SizedBox(
                      height: 350.h,
                      
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) =>
                              CustomMovieItem(moviesModel: state.movies[index],height: 250.h,width: 200.w,),),
                    )
              ],
            ),
          );
        }else if(state is MoviesNowPlayingFailureState){
         return CustomAlertDialog(error: 'state.errorMessage',onPressed: () {
               context.pushReplacementNamed(Routes.homeScreen);
             },);
        }else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
