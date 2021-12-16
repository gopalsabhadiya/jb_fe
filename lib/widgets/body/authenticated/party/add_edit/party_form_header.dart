import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class PartyFormHeader extends StatefulWidget {
  final PartyPresentation _party;
  const PartyFormHeader({Key? key, required party})
      : _party = party,
        super(key: key);

  @override
  State<PartyFormHeader> createState() => _PartyFormHeaderState();
}

class _PartyFormHeaderState extends State<PartyFormHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late PartyTypeEnum _currentFormState;

  @override
  void initState() {
    _currentFormState = widget._party.type;

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
            widget._party.setNewType(PartyTypeEnum.Customer);
            _animationController.forward();
            setState(() {
              _currentFormState = PartyTypeEnum.Customer;
            });
          },
        ),
        InkWell(
          child: _getVendorCapsule(),
          onTap: () {
            _animationController.animateBack(0);
            widget._party.setNewType(PartyTypeEnum.Retail);
            setState(() {
              _currentFormState = PartyTypeEnum.Retail;
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
          color: _getBackgroundColor(PartyTypeEnum.Customer),
          shape: const StadiumBorder()),
      child: AnimatedPadding(
        duration: AnimationDuration.SHORT,
        padding: EdgeInsets.only(
            top: _getPaddingVertical(PartyTypeEnum.Customer),
            bottom: _getPaddingVertical(PartyTypeEnum.Customer),
            left: 50,
            right: 50),
        child: AppTextBuilder(PartyText.CUSTOMER)
            .color(_getTextColor(PartyTypeEnum.Customer))
            .size(_getFontSize(PartyTypeEnum.Customer))
            .weight(AppFontWeight.SEMI_BOLD)
            .build(),
      ),
    );
  }

  Widget _getVendorCapsule() {
    return AnimatedContainer(
      duration: AnimationDuration.SHORT,
      decoration: ShapeDecoration(
          color: _getBackgroundColor(PartyTypeEnum.Retail),
          shape: const StadiumBorder()),
      child: AnimatedPadding(
        duration: AnimationDuration.SHORT,
        padding: EdgeInsets.only(
            top: _getPaddingVertical(PartyTypeEnum.Retail),
            bottom: _getPaddingVertical(PartyTypeEnum.Retail),
            left: 50,
            right: 50),
        child: AppTextBuilder(PartyText.RETAIL)
            .color(_getTextColor(PartyTypeEnum.Retail))
            .size(_getFontSize(PartyTypeEnum.Retail))
            .weight(AppFontWeight.SEMI_BOLD)
            .build(),
      ),
    );
  }

  Color _getBackgroundColor(PartyTypeEnum partyFormType) {
    switch (partyFormType) {
      case PartyTypeEnum.Customer:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return AppColors.blue_5;
          case PartyTypeEnum.Retail:
            return AppColors.blue_2;
        }
      case PartyTypeEnum.Retail:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return AppColors.blue_2;
          case PartyTypeEnum.Retail:
            return AppColors.blue_5;
        }
    }
  }

  Color _getTextColor(PartyTypeEnum partyFormType) {
    switch (partyFormType) {
      case PartyTypeEnum.Customer:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return AppColors.grey_1;
          case PartyTypeEnum.Retail:
            return AppColors.blue_5;
        }
      case PartyTypeEnum.Retail:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return AppColors.blue_5;
          case PartyTypeEnum.Retail:
            return AppColors.grey_1;
        }
    }
  }

  double _getFontSize(PartyTypeEnum partyFormType) {
    switch (partyFormType) {
      case PartyTypeEnum.Customer:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return 18;
          case PartyTypeEnum.Retail:
            return 16;
        }
      case PartyTypeEnum.Retail:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return 16;
          case PartyTypeEnum.Retail:
            return 18;
        }
    }
  }

  double _getPaddingVertical(PartyTypeEnum partyFormType) {
    switch (partyFormType) {
      case PartyTypeEnum.Customer:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return 15;
          case PartyTypeEnum.Retail:
            return 8;
        }
      case PartyTypeEnum.Retail:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return 8;
          case PartyTypeEnum.Retail:
            return 15;
        }
    }
  }

  _getOpacity(PartyTypeEnum partyFormType) {
    switch (partyFormType) {
      case PartyTypeEnum.Customer:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return 1;
          case PartyTypeEnum.Retail:
            return 0;
        }
      case PartyTypeEnum.Retail:
        switch (_currentFormState) {
          case PartyTypeEnum.Customer:
            return 0;
          case PartyTypeEnum.Retail:
            return 1;
        }
    }
  }
}
