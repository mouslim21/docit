import 'dart:ui';
import 'package:flutter/material.dart';
import 'page_model.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;
  final bool isRtl;

  PagerIndicator({
    this.viewModel,
    this.isRtl,
  });

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; ++i) {
      final page = viewModel.pages[i];

      var percentActive;
      if (i == viewModel.activeIndex) {
        percentActive = 1.0 - viewModel.slidePercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.leftToRight) {
        percentActive = viewModel.slidePercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      bool isHollow = i > viewModel.activeIndex ||
          (i == viewModel.activeIndex &&
              viewModel.slideDirection == SlideDirection.leftToRight);

      bubbles.add(
        PageBubble(
          viewModel: PageBubbleViewModel(
            page.iconAssetPath,
            page.color,
            isHollow,
            percentActive,
          ),
        ),
      );
    }

    final bubbleWidth = 55.0;
    final width = MediaQuery.of(context).size.width / 2;
    var translation =
        width - (viewModel.activeIndex * bubbleWidth) - (bubbleWidth / 2);
    if (viewModel.slideDirection == SlideDirection.leftToRight) {
      translation += bubbleWidth * viewModel.slidePercent;
    } else if (viewModel.slideDirection == SlideDirection.rightToLeft) {
      translation -= bubbleWidth * viewModel.slidePercent;
    }

    return Transform(
      transform: Matrix4.translationValues(
          isRtl ? -translation : translation, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bubbles,
      ),
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PagerIndicatorViewModel {
  final List<PageModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
      this.pages,
      this.activeIndex,
      this.slideDirection,
      this.slidePercent,
      );
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  PageBubble({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 65.0,
      child: Center(
        child: Container(
          width: lerpDouble(20.0, 45.0, viewModel.activePercent),
          height: lerpDouble(20.0, 45.0, viewModel.activePercent),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? const Color(0x88FFFFFF)
                .withAlpha((0x88 * viewModel.activePercent).round())
                : const Color(0x88FFFFFF),
            border: Border.all(
              color: viewModel.isHollow
                  ? const Color(0x88FFFFFF).withAlpha(
                  (0x88 * (1.0 - viewModel.activePercent)).round())
                  : Colors.transparent,
              width: 3.0,
            ),
          ),
          child: Opacity(
              opacity: viewModel.activePercent,
              child: _renderImageAsset(viewModel.iconAssetPath,
                  color: viewModel.color)
          ),
        ),
      ),
    );
  }
}

class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      this.iconAssetPath,
      this.color,
      this.isHollow,
      this.activePercent,
      );
}

Widget _renderImageAsset(String assetPath,
    {double width = 24, double height = 24, Color color = Colors.white}) {
  return Image.asset(
    assetPath,
    color: color,
    width: width,
    height: height,
  );
}
