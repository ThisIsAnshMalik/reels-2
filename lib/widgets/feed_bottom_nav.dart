import 'package:flutter/material.dart';

class FeedBottomNav extends StatelessWidget {
  const FeedBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home'),
    (icon: Icons.play_circle_outline, selectedIcon: Icons.play_circle, label: 'Shorts'),
    (icon: Icons.subscriptions_outlined, selectedIcon: Icons.subscriptions, label: 'Subscriptions'),
    (icon: Icons.video_library_outlined, selectedIcon: Icons.video_library, label: 'Library'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: SizedBox(
          height: 52,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final selected = index == selectedIndex;
              final color = selected ? Colors.white : Colors.white70;
              return InkWell(
                onTap: () => onTap(index),
                child: SizedBox(
                  width: 72,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(selected ? item.selectedIcon : item.icon, color: color, size: 26),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 10,
                          color: color,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
