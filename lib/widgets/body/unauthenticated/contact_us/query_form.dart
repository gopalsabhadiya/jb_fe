import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/query_form.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/contact_us.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class QueryForm extends StatefulWidget {
  const QueryForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QueryForm();
  }
}

class _QueryForm extends State<QueryForm> {
  QueryFormDTO queryFormDTO = QueryFormDTO();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          AppTextInput(
              onChanged: queryFormDTO.setUserEmail,
              prefixIcon: Icons.email_outlined,
              hint: ContactUsText.QUERY_FORM_EMAIL_HINT),
          const SizedBox(
            height: 20,
          ),
          AppTextInput(
              onChanged: queryFormDTO.setQuery,
              prefixIcon: Icons.contact_support_outlined,
              hint: ContactUsText.QUERY_FORM_QUERY_HINT),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: _getPlaceQueryButton(),
            onTap: () {
              print("Submit Query");
            },
          )
        ],
      ),
    );
  }

  Widget _getPlaceQueryButton() {
    return Container(
      decoration: const ShapeDecoration(
        color: AppColors.blue_5,
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.send_outlined,
            color: AppColors.grey_1,
            size: 25,
          ),
          const SizedBox(
            width: 20,
          ),
          AppTextBuilder(ContactUsText.QUERY_FORM_PLACE_QUERY)
              .paddingVertical(15)
              .color(AppColors.grey_1)
              .build(),
        ],
      ),
    );
  }
}
