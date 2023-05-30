import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_strings.dart';
import '../../components/home_page_components/head_section.dart';
import '../../components/job_details_components/email_website_feild.dart';

class CompanyPage extends StatelessWidget {
  String aboutCompany;
  String email;
  String webSite;
   CompanyPage({Key? key,required this.aboutCompany,required this.email,required this.webSite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadSection(
          LeftText:AppStrings.Contact_us ,
          RightText:"",
        ),
        EmailWebsiteField(email: email, webSite: webSite,),
        SizedBox(height:1.h,),
        HeadSection(
          LeftText:AppStrings.About_Company,
          RightText:"",
        ),
        SizedBox(height:1.h,),
        SizedBox(
          height:39.h,
          child: ListView(
            children: [
              Text(aboutCompany)
            ],
          ),
        )
      ],
    );
  }
}
