import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProjectDeadlineChipWidget extends StatelessWidget {
  const ProjectDeadlineChipWidget(
      {Key? key, required this.chipColor, required this.chipTitle})
      : super(key: key);
  final Color chipColor;
  final String chipTitle;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Chip(
      avatar: Icon(PhosphorIcons.clock),
      label: Text(
        chipTitle,
        style: themeData.textTheme.overline
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      backgroundColor: chipColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
