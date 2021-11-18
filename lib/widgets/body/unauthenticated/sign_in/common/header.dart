import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/constants/enum/form_type.dart';
import 'package:jb_fe/constants/texts/sign_in.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/util/transitions.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class SignInRegisterHeader extends StatefulWidget {
  final void Function({required FormType formType}) setFormType;

  const SignInRegisterHeader({Key? key, required this.setFormType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInRegisterHeader();
  }
}

class _SignInRegisterHeader extends State<SignInRegisterHeader>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late FormType _currentFormState;

  @override
  void initState() {
    super.initState();
    _currentFormState = FormType.LOGIN;
    _animationController =
        AnimationController(vsync: this, duration: AnimationDuration.SHORT);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 315,
          child: Row(
            children: [
              InkWell(
                child: _getLoginCapsule(),
                onTap: () {
                  _animationController.forward();
                  setState(() {
                    _currentFormState = FormType.LOGIN;
                  });
                  widget.setFormType(formType: FormType.LOGIN);
                },
              ),
              InkWell(
                child: _getRegisterCapsule(),
                onTap: () {
                  _animationController.animateBack(0);
                  setState(() {
                    _currentFormState = FormType.REGISTER;
                  });
                  widget.setFormType(formType: FormType.REGISTER);
                },
              ),
            ],
          ),
        ),
        AnimatedSwitcher(
          duration: AnimationDuration.SHORT,
          transitionBuilder: AppTransitions.fadeTransitionBuilder,
          child: AppTextBuilder(_getHeader())
              .size(35)
              .paddingVertical(40)
              .weight(AppFontWeight.BOLD)
              .color(AppColors.blue_5)
              .build(),
        ),
      ],
    );
  }

  Widget _getLoginCapsule() {
    return AnimatedContainer(
      duration: AnimationDuration.SHORT,
      decoration: ShapeDecoration(
          color: _getBackgroundColor(FormType.LOGIN),
          shape: const StadiumBorder()),
      child: AnimatedPadding(
        duration: AnimationDuration.SHORT,
        padding: EdgeInsets.only(
            top: _getPaddingVertical(FormType.LOGIN),
            bottom: _getPaddingVertical(FormType.LOGIN),
            left: 50,
            right: 50),
        child: AppTextBuilder(SignInText.SIGN_IN)
            .color(_getTextColor(FormType.LOGIN))
            .size(_getFontSize(FormType.LOGIN))
            .weight(AppFontWeight.SEMI_BOLD)
            .build(),
      ),
    );
  }

  Widget _getRegisterCapsule() {
    return AnimatedContainer(
      duration: AnimationDuration.SHORT,
      decoration: ShapeDecoration(
          color: _getBackgroundColor(FormType.REGISTER),
          shape: const StadiumBorder()),
      child: AnimatedPadding(
        duration: AnimationDuration.SHORT,
        padding: EdgeInsets.only(
            top: _getPaddingVertical(FormType.REGISTER),
            bottom: _getPaddingVertical(FormType.REGISTER),
            left: 50,
            right: 50),
        child: AppTextBuilder(SignInText.REGISTER)
            .color(_getTextColor(FormType.REGISTER))
            .size(_getFontSize(FormType.REGISTER))
            .weight(AppFontWeight.SEMI_BOLD)
            .build(),
      ),
    );
  }

  Color _getBackgroundColor(FormType formType) {
    switch (formType) {
      case FormType.LOGIN:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return AppColors.blue_5;
          case FormType.REGISTER:
            return AppColors.blue_2;
        }
      case FormType.REGISTER:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return AppColors.blue_2;
          case FormType.REGISTER:
            return AppColors.blue_5;
        }
    }
  }

  Color _getTextColor(FormType formType) {
    switch (formType) {
      case FormType.LOGIN:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return AppColors.grey_1;
          case FormType.REGISTER:
            return AppColors.blue_5;
        }
      case FormType.REGISTER:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return AppColors.blue_5;
          case FormType.REGISTER:
            return AppColors.grey_1;
        }
    }
  }

  double _getFontSize(FormType formType) {
    switch (formType) {
      case FormType.LOGIN:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return 18;
          case FormType.REGISTER:
            return 16;
        }
      case FormType.REGISTER:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return 16;
          case FormType.REGISTER:
            return 18;
        }
    }
  }

  double _getPaddingVertical(FormType formType) {
    switch (formType) {
      case FormType.LOGIN:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return 15;
          case FormType.REGISTER:
            return 8;
        }
      case FormType.REGISTER:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return 8;
          case FormType.REGISTER:
            return 15;
        }
    }
  }

  _getOpacity(FormType formType) {
    switch (formType) {
      case FormType.LOGIN:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return 1;
          case FormType.REGISTER:
            return 0;
        }
      case FormType.REGISTER:
        switch (_currentFormState) {
          case FormType.LOGIN:
            return 0;
          case FormType.REGISTER:
            return 1;
        }
    }
  }

  String _getHeader() {
    switch (_currentFormState) {
      case FormType.LOGIN:
        return SignInText.SIGN_IN_HEADER;
      case FormType.REGISTER:
        return SignInText.REGISTER_HEADER;
    }
  }
}
