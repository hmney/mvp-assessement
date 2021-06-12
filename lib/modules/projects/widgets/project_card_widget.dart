import 'package:flutter/material.dart';
import 'package:mvp_assessement/constants/naviagtion_type.dart';
import 'package:mvp_assessement/modules/projects/projects_module.dart';
import 'package:mvp_assessement/widgets/project_deadline_chip_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ProjectsModule.toProjectBoardPage(NAVIGATION_TYPE.PUSH_NAMED),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/attachements/attachement1.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: Text(
                          'Mobile App for new Cryptocurrency Cyro. API based data.')),
                  SizedBox(width: 5),
                  Icon(
                    PhosphorIcons.dotsThreeLight,
                  )
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet platea et in leo adipiscing lectus dui. Viverra.',
              ),
              SizedBox(height: 15),
              LinearPercentIndicator(
                percent: 0.6,
                progressColor: Color(0xFF0ACF83),
                backgroundColor: Color(0xFFDDDDDD),
                padding: EdgeInsets.zero,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TeamMemberWidget(),
                  ProjectDeadlineChipWidget(
                    chipColor: Colors.grey,
                    chipTitle: '7 days left',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMemberWidget extends StatelessWidget {
  const _TeamMemberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < 4; index++)
          Container(
            margin: EdgeInsets.only(right: 2),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/people/user${index + 1}.jpg',
                ),
              ),
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
