import 'package:aflami/features/ui/widgets/custom_drawer.dart';
import 'package:aflami/features/ui/widgets/custom_movies-list_view.dart';
import 'package:aflami/features/ui/widgets/custom_scrollable_appbar.dart';
import 'package:aflami/features/ui/widgets/movies_list_view_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          SliverToBoxAdapter(
            child: CustomListViewMovie(height: 200.h,title: 'Top Rated',listItem: CustomMovieItem(height: 150.h,),),
          ),
          SliverToBoxAdapter(child: CustomListViewMovie(height: 400,title: 'Popular',listItem: CustomMovieItem(height: 340.h,width:200.w,),),),
          SliverToBoxAdapter(child: CustomListViewMovie(height: 200.h,title: 'Upcoming',listItem: CustomMovieItem(height: 150.h,width: 250.w,),),),

        ],
      ),
    );
  }
}


