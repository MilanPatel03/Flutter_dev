import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const CachedImageCard({
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => const ColoredBox(color: Colors.grey),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
      ),
    );
  }
}
