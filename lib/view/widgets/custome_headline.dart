import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class HeadLine extends StatelessWidget {
  int? maxline1;
  int? maxline2;
  String? text1;
  String? text2;
  double? fontsize1;
  double? fontsize2;
  FontWeight? fontWeight1;
  FontWeight? fontWeight2;
  Color? colortext1;
  Color? colortext2;

  HeadLine({
    Key? key,
    this.fontsize1,
    this.fontWeight1,
    this.colortext1,
    this.text1,
    this.maxline1,
    this.fontsize2,
    this.fontWeight2,
    this.colortext2,
    this.text2,
    this.maxline2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(text1!,
                maxLines:maxline1 ,
                style:TextStyle(
                  fontSize:fontsize1 ,
                  fontWeight:fontWeight1 ,
                  color: colortext1,
                ),
              ),
            ],
          ),
          SizedBox(height:2.h,),
          Container(
            child: Text(text2!,
                  maxLines:maxline2 ,
                  style:TextStyle(
                    fontSize:fontsize2 ,
                    fontWeight:fontWeight2 ,
                    color: colortext2
                  ),
                ),

          )
        ],
      ),
    );
  }
}
