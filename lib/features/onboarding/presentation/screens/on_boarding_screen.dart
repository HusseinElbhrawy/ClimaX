import 'package:climax/core/utils/constant.dart';
import 'package:climax/features/onboarding/presentation/widget/on_boarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../widget/on_boarding_skip_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
  }

  int currentIndex = 0;

  void _updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          const OnBoardingSkipButtonWidget(),
        ],
      ),
      body: LiquidSwipe(
        liquidController: liquidController,
        enableLoop: false,
        enableSideReveal: true,
        onPageChangeCallback: (activePageIndex) =>
            _updateIndex(activePageIndex),
        slideIconWidget: const Icon(Icons.navigate_before_sharp),
        pages: AppConstant.onBoardingItems(context, liquidController)
            .map((item) => OnBoardingItemWidget(item: item))
            .toList(),
      ),
    );
  }
}
