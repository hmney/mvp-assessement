import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mvp_assessement/widgets/search_textfield_widget.dart';

class TeamMembersPage extends StatelessWidget {
  const TeamMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    final Map<int, List<String>> _teamMembers = {
      0: ['Abigail', 'Graphic designer'],
      1: ['Thomas Adam', 'Software engineer'],
      2: ['Lisa anne', 'Project Manager'],
      3: ['Garry Miller', 'DevOps engineer'],
      4: ['Thoomas chilbey', 'Software engineer'],
      5: ['Emma', 'Software engineer'],
      6: ['Alan', 'Software engineer'],
      7: ['Cameron', 'Software engineer'],
      8: ['Elizabeth', 'Software engineer'],
    };
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Team',
                  style: _themeData.textTheme.headline4?.copyWith(
                      color: _themeData.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 20),
              SearchTextFieldWidget(),
              SizedBox(height: 20),
            ]),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160.0,
              mainAxisExtent: 140.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return TeamMemberCardWidget(
                  name: _teamMembers[index]![0],
                  role: _teamMembers[index]![1],
                  index: index,
                );
              },
              childCount: _teamMembers.length,
            ),
          ),
        ],
      ),
    );
  }
}

class TeamMemberCardWidget extends StatelessWidget {
  const TeamMemberCardWidget(
      {Key? key, required this.name, required this.role, required this.index})
      : super(key: key);
  final String name;
  final String role;
  final int index;
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/images/people/user${index + 1}.jpg'),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: _themeData.textTheme.headline6?.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: _themeData.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              role,
              style: _themeData.textTheme.subtitle1?.copyWith(
                fontSize: 9.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff5d6d84),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
