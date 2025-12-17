
import 'package:flutter/material.dart';

class ChatsSearchBar extends StatelessWidget {
  const ChatsSearchBar({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: (string) {

                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tìm kiếm tin nhắn...",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
