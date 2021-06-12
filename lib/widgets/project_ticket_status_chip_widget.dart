import 'package:flutter/material.dart';

class ProjectTicketStatusChipWidget extends StatelessWidget {
  const ProjectTicketStatusChipWidget(
      {Key? key, required this.chipColor, required this.chipTitle})
      : super(key: key);
  final Color chipColor;
  final String chipTitle;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Chip(
      label: Text(
        chipTitle,
        style: themeData.textTheme.overline
            ?.copyWith(color: chipColor, fontWeight: FontWeight.w500),
      ),
      backgroundColor: chipColor.withOpacity(0.3),
      side: BorderSide(color: chipColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
