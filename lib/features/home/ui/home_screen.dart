import 'package:aflami/features/home/ui/widgets/custom_drawer.dart';
import 'package:aflami/features/home/ui/widgets/custom_upcoming_movies_button.dart';
import 'package:aflami/features/home/ui/widgets/now_playing_list_view.dart';
import 'package:aflami/features/home/ui/widgets/top_rated_list_view.dart';
import 'package:aflami/features/home/ui/widgets/custom_scrollable_appbar.dart';
import 'package:aflami/features/home/ui/widgets/top_rated_tv_shows.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  int currentIndex = 0;
var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          customScrollableAppBar(onPressed: (){scaffoldKey.currentState!.openDrawer();},
            context,
            currentIndex,
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 0.1,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: TopRatedListView(title: 'Top Rated',),
          ),
        const SliverToBoxAdapter(child: 
        NowPlayingListView(title: 'Now Playing',),),
        const SliverToBoxAdapter(child: CustomUpcomingMoviesButton(),),
        const SliverToBoxAdapter(child: 
        TopRateTVShows(title: 'Top Rated TV Shows',),)

        ],
      ),
    );
  }
}








