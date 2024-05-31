import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/app_strings.dart';

class SendOptions extends StatefulWidget {
  final VoidCallback close;
  const SendOptions({super.key, required this.close});

  @override
  State<SendOptions> createState() => _SendOptionsState();
}

class _SendOptionsState extends State<SendOptions> {
  int _selectedIndex = -1;

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.close();
  }

  @override
  Widget build(BuildContext context) {
    return SendOptionsContainer(
      children: [
        SendOptionTile(
          onTap: () => _handleTap(0),
          icon: Icons.security,
          text: AppStrings.cosyAreas,
          isSelected: _selectedIndex == 0,
        ),
        SendOptionTile(
          onTap: () => _handleTap(1),
          icon: Icons.wallet,
          text: AppStrings.price,
          isSelected: _selectedIndex == 1,
        ),
        SendOptionTile(
          onTap: () => _handleTap(2),
          icon: Icons.delete_sweep_outlined,
          text: AppStrings.infrastructure,
          isSelected: _selectedIndex == 2,
        ),
        SendOptionTile(
          onTap: () => _handleTap(3),
          icon: Icons.layers,
          text: AppStrings.withoutAnylayer,
          isSelected: _selectedIndex == 3,
        ),
      ],
    );
  }
}

class SendOptionsContainer extends StatelessWidget {
  final List<Widget> children;

  const SendOptionsContainer({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class SendOptionTile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String text;
  final bool isSelected;

  const SendOptionTile({
    required this.icon,
    required this.text,
    super.key,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        color: AppColors.deepGray,
        size: 20,
      ),
      onTap: onTap,
      selectedColor: AppColors.brightOrangeColor,
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColors.brightOrangeColor : AppColors.deepGray,
          fontSize: 13.5,
        ),
      ),
    );
  }
}
