import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../components/message_page_component/message_field.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.textcolor,
        centerTitle: false,
        leading:IconButton(onPressed: () {
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_outlined,color:AppColors.blackcolor,),
        ),
        title: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            CircleAvatar(),
            SizedBox(width: 2.w,),
            Text("User Name",style:TextStyle(color:AppColors.blackcolor),),
          ],
        ),
        elevation: 0,
      ),
      body:Stack(
        alignment:Alignment.center,
        children: [
          Padding(
            padding:EdgeInsets.all(6.0.w),
            child: SizedBox(
              height: 150.h,
              child: ListView.separated(itemBuilder: (context,index){
                  return Row(
                    mainAxisAlignment:(index==0||index==2)?MainAxisAlignment.start
                        :(index==1||index==3)?MainAxisAlignment.end:MainAxisAlignment.center,
                    children: [
                      Container(
                        height:15.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: (index==0||index==2)?AppColors.recevercolor
                              :(index==1||index==3)?AppColors.primrycolor:Colors.green,
                          borderRadius:BorderRadius.only(
                            topRight:(index==0 || index==2)?Radius.circular(5.w):(index==1 || index==3)?Radius.zero:Radius.zero ,
                            topLeft: (index==0 || index==2)?Radius.zero:(index==1||index==3)?Radius.circular(5.w):Radius.zero ,
                            bottomRight: (index==0 || index==2)?Radius.circular(5.w):(index==1||index==3)?Radius.circular(5.w):Radius.zero,
                            bottomLeft:(index==0 || index==2)?Radius.circular(5.w):(index==1||index==3)?Radius.circular(5.w):Radius.zero
                          )
                        ),
                      ),
                    ],
                  );

                }, separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 2.h,); }, itemCount: 4,
                ),

            ),
          ),
          Positioned(
           bottom:0.h,
            child: Container(
              height:13.h,
              width: 100.w,
              decoration:BoxDecoration(
                color:AppColors.textcolor,
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){},
                        child: SvgPicture.asset(AppImages.paperclip)),
                    Flexible(
                        child: MessageField()),
                    InkWell(
                      onTap: (){},
                        child: SvgPicture.asset(AppImages.Send_icon))
                  ],
                ),
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
