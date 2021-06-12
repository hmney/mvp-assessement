import 'package:flutter/material.dart';
import 'package:mvp_assessement/modules/projects/widgets/project_card_widget.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Projects',
                style: _themeData.textTheme.headline4?.copyWith(
                    color: _themeData.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 40),
            for (var i = 0; i < 6; i++) ProjectCardWidget(),
          ],
        ),
      ),
    );
  }
}
