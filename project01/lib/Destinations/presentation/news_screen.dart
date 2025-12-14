// lib/destinations/presentation/news_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project01/Destinations/presentation/widgets/newsBottomSheet.dart';

import '../../Commons/constants.dart';
import '../../Commons/padding.dart';
import '../data/repositories/destination_repository_impl.dart';
import '../domain/models/news_item.dart';

class NewsScreen extends StatelessWidget {
  final DestinationType type;
  const NewsScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DestinationRepositoryImplementation().getNews(type),
      builder: (context, ss) {
        if (ss.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.orangeAccent.shade200),
          );
        }

        if (!ss.hasData || ss.data!.isEmpty) {
          return const Center(
              child: Text("No News Found", style: TextStyle(color: Colors.white70)));
        }

        final newsList = ss.data!;

        return ListView.builder(
          padding: AppPadding.centerPaddingOverall25(context),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final n = newsList[index];
            return _NewsCard(item: n);
          },
        );
      },
    );
  }
}


class _NewsCard extends StatelessWidget {
  final NewsItem item;
  const _NewsCard({required this.item});

  @override
  Widget build(BuildContext context) {

    String timeAgo() {
      final diff = DateTime.now().difference(item.publishTime);

      if (diff.inHours < 24) return "${diff.inHours}h ago";
      return "${diff.inDays}d ago";
    }

    return InkWell(
      onTap: (){
        openNewsBottomSheet(context, item);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xff1f1f1f),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(color: Colors.grey[800]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Text(item.source,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12)),
                      const SizedBox(width: 10),
                      Text("• ${timeAgo()}",
                          style: const TextStyle(
                              color: Colors.white38, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









// return Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Icon(Icons.article_outlined, size: 64, color: Colors.white30),
//       const SizedBox(height: 16),
//       Text("News for ${type.title}", style: const TextStyle(fontSize: 18, color: Colors.white70)),
//       const Text("Coming soon...", style: TextStyle(color: Colors.white54)),
//     ],
//   ),
// );