import 'package:flutter/material.dart';
import 'package:project01/Commons/padding.dart';

class StoryProgressIndicators extends StatelessWidget {
  final int itemCount;
  final int currentIndex;        // already normalized 0..itemCount-1
  final Animation<double> progress;

  const StoryProgressIndicators({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount <= 0) return const SizedBox.shrink();

    return Padding(
      padding: AppPadding.centerPaddingHorizontal75(context),
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, _) {
          return Row(
            children: List.generate(itemCount, (index) {
              final isActive = index == currentIndex;
              final isDone = index < currentIndex;
      
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.22), // grey bg bar
                    borderRadius: BorderRadius.circular(999),
                  ),
      
                  // INNER WHITE FILL
                  child: isActive
                      ? FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress.value, // 0 → 1
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: progress.value > 0.05
                            ? [
                          BoxShadow(
                            color: Colors.orangeAccent.shade200,
                            blurRadius: 3,
                          ),
                        ]
                            : null,
                      ),
                    ),
                  )
                      : isDone
                      ? Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade200,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  )
                      : const SizedBox.shrink(),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
