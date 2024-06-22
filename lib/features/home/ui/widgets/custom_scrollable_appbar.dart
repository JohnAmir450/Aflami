import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/networking/constants.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/widgets/custom_alret_dialog.dart';
import 'package:aflami/features/home/logic/popular_cubit/popular_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

SliverAppBar customScrollableAppBar(BuildContext context, int currentIndex,
    {required CarouselOptions options, required void Function()? onPressed}) {
  return SliverAppBar(
      backgroundColor: const Color(0xff0A071E),
      leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          )),
      actions: [
        IconButton(
          onPressed: () {
            context.pushNamed(Routes.searchScreen);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white,
          ),
        )
      ],
      expandedHeight: MediaQuery.sizeOf(context).height / 1.5,
      // pinned: true,
      floating: true,
      flexibleSpace: BlocBuilder<PopularCubit, PopularState>(
        builder: (context, state) {
          if (state is MoviesPopularSuccessState) {
             
            return FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    state.movies.length > 8 ? 8 : state.movies.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: CircleAvatar(
                            radius: currentIndex == index ? 5 : 4,
                            backgroundColor: currentIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        )),
              ),
              titlePadding: const EdgeInsets.only(),
              background: CarouselSlider.builder(
                  itemCount: state.movies.length > 8 ? 8 : state.movies.length,
                  itemBuilder: (context, index, currentIndex) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.movieDetails,
                                arguments: state.movies[index]);
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Constants.imageUrl}${state.movies[index].posterPath}',
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: ColorsManager.mainPurple,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                  options: options),
            );
          } else if (state is MoviesPopularFailureState) {
            return CustomAlertDialog(error: 'state.errorMessage',onPressed: () {
               context.pushReplacementNamed(Routes.homeScreen);
             },);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ));
}
