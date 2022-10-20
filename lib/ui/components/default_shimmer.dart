import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultAppShimmer extends StatelessWidget {
  const DefaultAppShimmer({
    Key? key,
    this.withBanner = false,
  }) : super(key: key);

  final bool withBanner;

  Widget _placeholderItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 16),
        ContentPlaceholder(
          lineType: ContentLineType.threeLines,
        ),
        SizedBox(height: 16),
        TitlePlaceholder(width: 200),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (withBanner) ...[
              const BannerPlaceholder(),
              const TitlePlaceholder(width: double.infinity),
            ],
            _placeholderItem(context),
            _placeholderItem(context),
            _placeholderItem(context),
            _placeholderItem(context),
            _placeholderItem(context),
            _placeholderItem(context),
          ],
        ),
      ),
    );
  }
}

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 12,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: width,
            height: 12,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);
  final ContentLineType lineType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                Container(
                  width: 100,
                  height: 10,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
