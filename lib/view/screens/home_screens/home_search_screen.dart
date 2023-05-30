import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../blocs/home_search_cubit/home_search_cubit.dart';
import '../../components/home_page_components/search_bar.dart';
import '../../pages/search_pages/search_result_page.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSearchCubit,HomeSearchState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
       Scaffold(
          backgroundColor: AppColors.textcolor,
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6.0.w, top: 2.h),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.blackcolor,
                        )),
                    Expanded(
                        child: SearchBar(
                          controller:HomeSearchCubit.get(context).search_text_controller,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          // onChange: () {
                          //   return context.read<HomeSearchCubit>().onTextChange();
                          // },
                          // onSubmit: () {
                          //   HomeSearchCubit.get(context).onSearchBarSubmit(context);
                          // },
                        )),
                  ],
                ),
              ),
                   ResultPage()
            ],
          )),
    );
  }
}
