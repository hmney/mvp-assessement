import 'package:flutter/material.dart';
import 'package:mvp_assessement/core/auth/auth_module.dart';
import 'package:mvp_assessement/core/auth/widgets/auth_page_title_widget.dart';
import 'package:mvp_assessement/widgets/custom_elevated_button_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            iconTheme: IconThemeData(color: _themeData.primaryColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  AuthPageTitleWidget(
                    title: 'Reset password',
                  ),
                  SizedBox(height: 20),
                  _ForgotPasswordPageDescriptionWidget(),
                  SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButtonWidget(
                    onPressed: () => AuthModule.toEmailSentPage(),
                    label: 'SEND',
                    icon: PhosphorIcons.arrowRightLight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordPageDescriptionWidget extends StatelessWidget {
  const _ForgotPasswordPageDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Text(
      "Enter the email associated with your account and we'll send an email with instructions to reset your password ",
      style: _themeData.textTheme.subtitle1?.copyWith(
        color: Color(0xff5D6D84),
      ),
    );
  }
}
