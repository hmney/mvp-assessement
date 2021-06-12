import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mvp_assessement/config/themes/light_theme.dart';
import 'package:mvp_assessement/constants/naviagtion_type.dart';
import 'package:mvp_assessement/modules/projects/projects_module.dart';
import 'package:mvp_assessement/widgets/custom_elevated_button_widget.dart';
import 'package:mvp_assessement/widgets/custom_spacer_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

class CreateNewProjectPage extends StatefulWidget {
  const CreateNewProjectPage({Key? key}) : super(key: key);

  @override
  _CreateNewProjectPageState createState() => _CreateNewProjectPageState();
}

class _CreateNewProjectPageState extends State<CreateNewProjectPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Create new project'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        _ProjectNameWidget(),
                        SizedBox(height: 20),
                        _ProjectDescriptionWidget(),
                        SizedBox(height: 20),
                        _ProjectImageWidget(),
                        SizedBox(height: 20),
                        _ProjectTeamMembersWidget(),
                        SizedBox(height: 20),
                        _ProjectDeadlineWidget(),
                        CustomSpacer(
                          minHeight: 40,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomElevatedButtonWidget(
                            onPressed: () => ProjectsModule.toProjectBoardPage(
                              NAVIGATION_TYPE.PUSH_REPLACEMENT_NAMED,
                            ),
                            label: 'DONE',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProjectNameWidget extends StatelessWidget {
  const _ProjectNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'Enter project name',
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: 'Project name',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}

class _ProjectDescriptionWidget extends StatelessWidget {
  const _ProjectDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'Add a description',
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: 'Project description',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}

class _ProjectImageWidget extends StatelessWidget {
  const _ProjectImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project image',
          style: TextStyle(fontSize: 12, color: themeData.primaryColor),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => null,
          child: Row(
            children: [
              Text(
                'Add an image',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Icon(
                PhosphorIcons.uploadLight,
                size: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ProjectTeamMembersWidget extends StatefulWidget {
  const _ProjectTeamMembersWidget({Key? key}) : super(key: key);

  @override
  __ProjectTeamMembersWidgetState createState() =>
      __ProjectTeamMembersWidgetState();
}

class __ProjectTeamMembersWidgetState extends State<_ProjectTeamMembersWidget> {
  late int teamMemebersCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Team members'),
        SizedBox(height: 10),
        Container(
          height: 24,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: teamMemebersCount + 1,
              itemBuilder: (context, index) {
                if (index == teamMemebersCount) {
                  return DottedBorder(
                    borderType: BorderType.Circle,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          teamMemebersCount++;
                        });
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          PhosphorIcons.plusLight,
                          size: 16,
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/people/user${Random().nextInt(3) + 1}.jpg',
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                );
              }),
        )
      ],
    );
  }
}

class _ProjectDeadlineWidget extends StatefulWidget {
  const _ProjectDeadlineWidget({Key? key}) : super(key: key);

  @override
  __ProjectDeadlineWidgetState createState() => __ProjectDeadlineWidgetState();
}

class __ProjectDeadlineWidgetState extends State<_ProjectDeadlineWidget> {
  TextEditingController projectCreationDateController = TextEditingController();
  TextEditingController projectStartDateController = TextEditingController(
    text: 'Select start date',
  );
  TextEditingController projectDueDateController = TextEditingController(
    text: 'Select due date',
  );

  @override
  void initState() {
    super.initState();
    projectCreationDateController.text =
        DateFormat('d MMMM y').format(DateTime.now());
  }

  Future<DateTime?> _showDatePicker(
          BuildContext context, String helpText) async =>
      await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime(2050),
        helpText: helpText,
      );

  void functionName(BuildContext context, String selectedTime) async {
    if (selectedTime == 'Start date') {
      final projectStartDate = await _showDatePicker(context, selectedTime);
      if (projectStartDate != null)
        projectStartDateController.text =
            DateFormat('d MMMM y').format(projectStartDate);
    } else {
      final projectDueDate = await _showDatePicker(context, selectedTime);
      if (projectDueDate != null)
        projectDueDateController.text =
            DateFormat('d MMMM y').format(projectDueDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: projectCreationDateController,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date',
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(),
            errorBorder: UnderlineInputBorder(),
            disabledBorder: UnderlineInputBorder(),
            focusedErrorBorder: UnderlineInputBorder(),
            suffix: Icon(
              PhosphorIcons.calendarLight,
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: projectStartDateController,
                readOnly: true,
                onTap: () => functionName(context, 'Start date'),
                decoration: InputDecoration(
                  labelText: 'Start date',
                  border: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  errorBorder: UnderlineInputBorder(),
                  disabledBorder: UnderlineInputBorder(),
                  focusedErrorBorder: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: TextFormField(
                controller: projectDueDateController,
                readOnly: true,
                onTap: () => functionName(context, 'Due date'),
                decoration: InputDecoration(
                  labelText: 'End date',
                  border: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  errorBorder: UnderlineInputBorder(),
                  disabledBorder: UnderlineInputBorder(),
                  focusedErrorBorder: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
