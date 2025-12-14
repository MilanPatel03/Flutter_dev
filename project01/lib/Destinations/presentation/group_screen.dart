// lib/destinations/presentation/group_screen.dart
import 'package:flutter/material.dart';

import '../../Commons/constants.dart';
import '../../Commons/padding.dart';
import '../data/repositories/destination_repository_impl.dart';

class GroupScreen extends StatelessWidget {
  final DestinationType type;
  const GroupScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DestinationRepositoryImplementation().getGroupChats(type),
      builder: (context, ss) {
        if (ss.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.orangeAccent.shade200),
          );
        }

        if (!ss.hasData || ss.data!.isEmpty) {
          return const Center(
            child: Text("No Groups Found", style: TextStyle(color: Colors.white70)),
          );
        }

        // List<String> group names (from your repo)
        final groupNames = ss.data!;

        return ListView.builder(
          padding: AppPadding.centerPaddingOverall25(context),
          itemCount: groupNames.length,
          itemBuilder: (context, index) {
            return _SimpleGroupCard(name: groupNames[index]);
          },
        );
      },
    );
  }
}

class _SimpleGroupCard extends StatelessWidget {
  final String name;
  const _SimpleGroupCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1f1f1f),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.groups, size: 40, color: Colors.white30),
          const SizedBox(width: 16),
          Expanded(
            child: Text(name,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white30, size: 16),
        ],
      ),
    );
  }
}







// return Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Icon(Icons.groups, size: 64, color: Colors.white30),
//       const SizedBox(height: 16),
//       Text("Group Chats for ${type.title}", style: const TextStyle(fontSize: 18, color: Colors.white70)),
//       const Text("Join community discussions", style: TextStyle(color: Colors.white54)),
//     ],
//   ),
// );