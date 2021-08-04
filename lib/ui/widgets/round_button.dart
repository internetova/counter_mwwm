import 'package:flutter/material.dart';

/// круглая кнопка
class RoundButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final VoidCallback onPressed;

  const RoundButton({
    Key? key,
    required this.size,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Theme.of(context).accentColor,
      child: IconButton(
        onPressed: onPressed,
        iconSize: size,
        icon: Icon(icon),
      ),
    );
  }
}
