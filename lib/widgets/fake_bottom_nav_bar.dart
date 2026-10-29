import 'package:flutter/material.dart';

class FakeBottomNavBar extends StatelessWidget {
  const FakeBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home'),
    (
      icon: Icons.play_circle_outline,
      selectedIcon: Icons.play_circle,
      label: 'Shorts',
    ),
    (
      icon: Icons.subscriptions_outlined,
      selectedIcon: Icons.subscriptions,
      label: 'Subscriptions',
    ),
    (
      icon: Icons.video_library_outlined,
      selectedIcon: Icons.video_library,
      label: 'Library',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A))),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final selected = index == selectedIndex;
              return InkWell(
                onTap: () => onTap(index),
                child: SizedBox(
                  width: 72,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selected ? item.selectedIcon : item.icon,
                        color: selected ? Colors.white : Colors.grey,
                        size: 26,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 10,
                          color: selected ? Colors.white : Colors.grey,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.normal,
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
