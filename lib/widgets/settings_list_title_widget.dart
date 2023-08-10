import 'package:flutter/material.dart';

class SettingListTileWidget extends StatefulWidget {
  final String destinationRoute;
  final String listTileName;

  const SettingListTileWidget({
    super.key,
    required this.destinationRoute,
    required this.listTileName,
  });

  @override
  State<SettingListTileWidget> createState() => _SettingListTileWidgetState();
}

class _SettingListTileWidgetState extends State<SettingListTileWidget> {
  var isSelected = false;
  var myColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, widget.destinationRoute);
      },
      onLongPress: () {},
      title: Text(
        widget.listTileName,
      ),
      trailing: const Icon(Icons.keyboard_arrow_right,
          color: Colors.deepPurpleAccent),
    );
  }
}