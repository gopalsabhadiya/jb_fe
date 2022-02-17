import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/authentication/login_form_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/constants/enum/form_type.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/util/transitions.dart';
import 'package:jb_fe/widgets/body/unauthenticated/sign_in/register/register_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/svg/logo_svg.dart';

import 'common/header.dart';
import 'login/login_form.dart';

class AppSignIn extends StatefulWidget {
  const AppSignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppSignIn();
  }
}

class _AppSignIn extends State<AppSignIn> {
  FormType _formType = FormType.LOGIN;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue_1,
      child: Padding(
        padding: EdgeInsets.all(ScreenSizeUtil.getContentPadding(context)),
        child: Wrap(
          clipBehavior: Clip.hardEdge,
          spacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
          runSpacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoSVG(),
                const SizedBox(
                  height: 25,
                ),
                AppTextBuilder("LET'S GET STARTED").size(20).build()
              ],
            ),
            Column(
              children: [
                SignInRegisterHeader(
                  setFormType: _setFormType,
                ),
                AnimatedSwitcher(
                  duration: AnimationDuration.SHORT,
                  child: _getForm(),
                  transitionBuilder: AppTransitions.slideTransitionBuilder,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _setFormType({required FormType formType}) {
    setState(() {
      _formType = formType;
    });
  }

  Widget _getForm() {
    switch (_formType) {
      case FormType.LOGIN:
        return LoginForm(
          loginPresentation: LoginPresentation.empty(),
        );
      case FormType.REGISTER:
        return const RegisterForm();
    }
  }
}
