import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/end_drawer/settings/content.dart';

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
        const SettingsContent(),
      ],
    );
  }

  _cancelSave(BuildContext context) {
    Navigator.of(context).pop();
  }

  _saveSettings(BuildContext context) {
    print("Save Settings");
  }
}
