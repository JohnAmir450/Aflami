import 'package:aflami/core/thiming/font_helper.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

SliverAppBar customScrollableAppBar(BuildContext context,int currentIndex,{required CarouselOptions options,required void Function()? onPressed}) {
    return SliverAppBar(
         
          backgroundColor: const Color(0xff0A071E),
          leading: IconButton(onPressed: onPressed, icon: const Icon(Icons.menu,color: Colors.white,)),
          expandedHeight: MediaQuery.sizeOf(context).height / 1.5,
         // pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(3, (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CircleAvatar(radius:currentIndex==index? 5:4,backgroundColor: currentIndex==index? Colors.white:Colors.grey,),
                )),),
            titlePadding: const EdgeInsets.only(),
            background: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, currentIndex) => SizedBox(
                
                width: MediaQuery.sizeOf(context).width,
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/vikings_photo.jpg',
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Optional for centering
                        children: [
                          const Spacer(flex: 5),
                          const Text(
                            'Vikings',
                            style: TextStyles.font30WhiteSemibold,
                          ),
                          Text(
                            'Para maratonear',
                            style: TextStyles.font15WhiteRegular.copyWith(
                              fontWeight: FontWeightHelper.light,
                            ),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. Eget dictum est penatibus eget nunc. Enim pellentesque venenatis enim.',
                            textAlign: TextAlign.center,
                            style: TextStyles.font12GreyLight.copyWith(),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              options: options
          ),)
        );
  }