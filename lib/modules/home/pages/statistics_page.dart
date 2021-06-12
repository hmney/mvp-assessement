import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dashboard',
              style: _themeData.textTheme.headline4?.copyWith(
                  color: _themeData.primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 40),
          _NumberOfProjectsWiget(),
          SizedBox(height: 30),
          _TypeOfProjectWidget(
            typeOfProject: 'Completed',
            numberOfProject: '8',
            progress: 0.6,
            color: Color(0xff8676FF),
          ),
          SizedBox(height: 30),
          _TypeOfProjectWidget(
            typeOfProject: 'Out of schedule',
            numberOfProject: '6',
            color: Color(0xffFF708B),
            progress: 0.4,
          ),
          SizedBox(height: 30),
          _TypeOfProjectWidget(
            typeOfProject: 'In progress',
            numberOfProject: '16',
            color: Color(0xffFFBA69),
            progress: 0.8,
          ),
        ],
      ),
    );
  }
}

class _NumberOfProjectsWiget extends StatelessWidget {
  const _NumberOfProjectsWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total projects',
            style: _themeData.textTheme.subtitle2
                ?.copyWith(color: Color(0xff5D6D84)),
          ),
          Text(
            '30',
            style: _themeData.textTheme.headline6
                ?.copyWith(color: _themeData.primaryColor),
          ),
        ],
      ),
    );
  }
}

class _TypeOfProjectWidget extends StatelessWidget {
  const _TypeOfProjectWidget({
    Key? key,
    required this.typeOfProject,
    required this.numberOfProject,
    required this.color,
    required this.progress,
  }) : super(key: key);

  final String typeOfProject;
  final String numberOfProject;
  final Color color;
  final double progress;
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              typeOfProject,
              style: _themeData.textTheme.caption
                  ?.copyWith(color: _themeData.primaryColor),
            ),
            Text(
              numberOfProject,
              style: _themeData.textTheme.caption
                  ?.copyWith(color: _themeData.primaryColor),
            ),
          ],
        ),
        SizedBox(height: 5),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          progressColor: color,
          backgroundColor: Color(0xffDBDFF1),
          percent: progress,
        ),
      ],
    );
  }
}
