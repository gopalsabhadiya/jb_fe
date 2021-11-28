import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/constants/enum/form_type.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class PartyFormHeader extends StatefulWidget {
  const PartyFormHeader({Key? key}) : super(key: key);

  @override
  State<PartyFormHeader> createState() => _PartyFormHeaderState();
}

class _PartyFormHeaderState extends State<PartyFormHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late PartyFormType _currentFormState;

  @override
  void initState() {
    _currentFormState = PartyFormType.CUSTOMER;

    super.initState();
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: _getCustomerCapsule(),
          onTap: () {
            _animationController.forward();
            setState(() {
              _currentFormState = PartyFormType.CUSTOMER;
            });
          },
        ),
        InkWell(
          child: _getVendorCapsule(),
          onTap: () {
            _animationController.animateBack(0);
            setState(() {
              _currentFormState = PartyFormType.VENDOR;
            });
          },
        ),
      ],
    );
  }

  Widget _getCustomerCapsule() {
    return AnimatedContainer(
      duration: AnimationDuration.SHORT,
      decoration: ShapeDecoration(
          color: _getBackgroundColor(PartyFormType.CUSTOMER),
          shape: const StadiumBorder()),
      child: AnimatedPadding(
        duration: AnimationDuration.SHORT,
        padding: EdgeInsets.only(
            top: _getPaddingVertical(PartyFormType.CUSTOMER),
            bottom: _getPaddingVertical(PartyFormType.CUSTOMER),
            left: 50,
            right: 50),
        child: AppTextBuilder(PartyText.CUSTOMER)
            .color(_getTextColor(PartyFormType.CUSTOMER))
            .size(_getFontSize(PartyFormType.CUSTOMER))
            .weight(AppFontWeight.SEMI_BOLD)
            .build(),
      ),
    );
  }

  Widget _getVendorCapsule() {
    return AnimatedContainer(
      duration: AnimationDuration.SHORT,
      decoration: ShapeDecoration(
          color: _getBackgroundColor(PartyFormType.VENDOR),
          shape: const StadiumBorder()),
      child: AnimatedPadding(
        duration: AnimationDuration.SHORT,
        padding: EdgeInsets.only(
            top: _getPaddingVertical(PartyFormType.VENDOR),
            bottom: _getPaddingVertical(PartyFormType.VENDOR),
            left: 50,
            right: 50),
        child: AppTextBuilder(PartyText.VENDOR)
            .color(_getTextColor(PartyFormType.VENDOR))
            .size(_getFontSize(PartyFormType.VENDOR))
            .weight(AppFontWeight.SEMI_BOLD)
            .build(),
      ),
    );
  }

  Color _getBackgroundColor(PartyFormType partyFormType) {
    switch (partyFormType) {
      case PartyFormType.CUSTOMER:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return AppColors.blue_5;
          case PartyFormType.VENDOR:
            return AppColors.blue_2;
        }
      case PartyFormType.VENDOR:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return AppColors.blue_2;
          case PartyFormType.VENDOR:
            return AppColors.blue_5;
        }
    }
  }

  Color _getTextColor(PartyFormType partyFormType) {
    switch (partyFormType) {
      case PartyFormType.CUSTOMER:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return AppColors.grey_1;
          case PartyFormType.VENDOR:
            return AppColors.blue_5;
        }
      case PartyFormType.VENDOR:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return AppColors.blue_5;
          case PartyFormType.VENDOR:
            return AppColors.grey_1;
        }
    }
  }

  double _getFontSize(PartyFormType partyFormType) {
    switch (partyFormType) {
      case PartyFormType.CUSTOMER:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return 18;
          case PartyFormType.VENDOR:
            return 16;
        }
      case PartyFormType.VENDOR:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return 16;
          case PartyFormType.VENDOR:
            return 18;
        }
    }
  }

  double _getPaddingVertical(PartyFormType partyFormType) {
    switch (partyFormType) {
      case PartyFormType.CUSTOMER:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return 15;
          case PartyFormType.VENDOR:
            return 8;
        }
      case PartyFormType.VENDOR:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return 8;
          case PartyFormType.VENDOR:
            return 15;
        }
    }
  }

  _getOpacity(PartyFormType partyFormType) {
    switch (partyFormType) {
      case PartyFormType.CUSTOMER:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return 1;
          case PartyFormType.VENDOR:
            return 0;
        }
      case PartyFormType.VENDOR:
        switch (_currentFormState) {
          case PartyFormType.CUSTOMER:
            return 0;
          case PartyFormType.VENDOR:
            return 1;
        }
    }
  }
}
