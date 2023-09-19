import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/navigation/root_navigation_controller.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  var currentIndex = 0;

  final RootNavigationController rootNavigationController =
      Get.find<RootNavigationController>();

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .02),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              rootNavigationController.pageIndex.value = index;
              HapticFeedback.lightImpact();
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? displayWidth * .32
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == currentIndex ? displayWidth * .12 : 0,
                  width: index == currentIndex ? displayWidth * .32 : 0,
                  decoration: BoxDecoration(
                    color: index == currentIndex
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? displayWidth * .31
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex ? displayWidth * .13 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == currentIndex ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == currentIndex ? listOfStrings[index] : '',
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width:
                              index == currentIndex ? displayWidth * .03 : 20,
                        ),
                        getIcons()[index],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getIcons() {
    return [
      rootNavigationController.pageIndex.value == 0
          ? const Icon(
              Icons.home_rounded,
              color: AppColors.primary,
            )
          : const Icon(
              Icons.home_outlined,
              color: Color(0xff97979B),
            ),
      rootNavigationController.pageIndex.value == 1
          ? SvgPicture.asset(
              'assets/icons/bag-solid.svg',
              color: AppColors.primary,
            )
          : SvgPicture.asset(
              'assets/icons/bag-outlined.svg',
              color: const Color(0xff97979B),
            ),
      rootNavigationController.pageIndex.value == 2
          ? const Icon(Icons.favorite_rounded, color: AppColors.primary)
          : const Icon(
              Icons.favorite_outline_rounded,
              color: Color(0xff97979B),
            ),
      rootNavigationController.pageIndex.value == 3
          ? SvgPicture.asset('assets/icons/profile-solid.svg',
              color: AppColors.primary)
          : SvgPicture.asset(
              'assets/icons/profile-outlined.svg',
              color: const Color(0xff97979B),
            ),
    ];
  }

  List<String> listOfStrings = [
    'Accueil',
    'Panier',
    'Favoris',
    'Profile',
  ];
}

class NavigationItem extends StatelessWidget {
  const NavigationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/home-solid.svg',
          color: AppColors.primary,
          height: 25,
        ),
      ),
    );
  }
}
