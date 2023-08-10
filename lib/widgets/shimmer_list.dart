import 'package:flutter/material.dart';
import 'package:longtime/widgets/shimmer_item.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5, // Set the desired number of shimmer items
      itemBuilder: (context, index) {
        return const ShimmerItem();
      },
    );
  }
}
