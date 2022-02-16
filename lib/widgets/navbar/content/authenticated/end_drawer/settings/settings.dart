import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/business/update_business/update_business_bloc.dart';
import 'package:jb_fe/controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

import 'content.dart';

class EndDrawerSettings extends StatelessWidget {
  const EndDrawerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SaveCancelBar(
          cancelCallback: () => _cancelSave(context),
          saveCallback: () => _saveSettings(context),
        ),
        SettingsContent(
          closeDrawer: () => _cancelSave(context),
        ),
      ],
    );
  }

  _cancelSave(BuildContext context) {
    Navigator.of(context).pop();
    BlocProvider.of<ProfileOrSettingsCubit>(context).closeDrawer();
  }

  _saveSettings(BuildContext context) {
    BlocProvider.of<UpdateBusinessBloc>(context).add(UpdateBusiness(
        business: BlocProvider.of<BusinessDataBloc>(context).state.business!));
  }
}
