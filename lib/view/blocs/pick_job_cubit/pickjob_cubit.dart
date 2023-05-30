import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_strings.dart';
import '../../../domin/usecase/update_profile_usecase.dart';
import '../../screens/home_screens/home_screen.dart';
part 'pickjob_state.dart';

class PickjobCubit extends Cubit<PickjobState> {
  PickjobCubit() : super(PickjobInitial());

  List<WorkType> listOfWorkType = [
   WorkType(workType: AppStrings.workfromoffice, isSelected: false),
    WorkType(workType: AppStrings.remotwork, isSelected: false)
  ];

  List<WorkField> listOfWorkFields = [
    WorkField(image: AppImages.ic1, jopName: "UI/UX Designer", isSelected: false),
    WorkField(image: AppImages.ic2, jopName: "Ilustrator Designer", isSelected: false),
    WorkField(image: AppImages.ic3, jopName: "Developer", isSelected: false),
    WorkField(image: AppImages.ic4, jopName: "Management", isSelected: false),
    WorkField(image: AppImages.ic5, jopName: "Information Technology", isSelected: false),
    WorkField(image: AppImages.ic6, jopName: "Research and Analytics", isSelected: false),
  ];
  
  List<CountryField> listOfCountryFields = [
    CountryField(image: AppImages.united_state, countryName: "United State", isSelected: false),
    CountryField(image: AppImages.malasya, countryName: "Malasya", isSelected: false),
    CountryField(image: AppImages.singapora, countryName: "Sengapora", isSelected: false),
    CountryField(image: AppImages.indonesia, countryName: "Indonesia", isSelected: false),
    CountryField(image: AppImages.philiphins, countryName: "Philiphines", isSelected: false),
    CountryField(image: AppImages.polandia, countryName: "Polandia", isSelected: false),
    CountryField(image: AppImages.india, countryName: "India", isSelected: false),
    CountryField(image: AppImages.vietnam, countryName: "Vietnam", isSelected: false),
    CountryField(image: AppImages.china, countryName: "China", isSelected: false),
    CountryField(image: AppImages.canada, countryName: "Canada", isSelected: false),
    CountryField(image: AppImages.saudi_arabia, countryName: "Saudi Arabia", isSelected: false),
    CountryField(image: AppImages.argentina, countryName: "Argentina", isSelected: false),
    CountryField(image: AppImages.brazil, countryName: "Brazil", isSelected: false),
  ];

  static PickjobCubit get(context) => BlocProvider.of(context);

  PageController pageview_controller = PageController();
  int currentindex = 0;
  int tabTextIndexSelected = 0;

  String getWorkType(){
   if(tabTextIndexSelected == 0){
     return  AppStrings.workfromoffice;
   }else{
     return AppStrings.remotwork;
   }
  }




  String selectedCountry(){
    List<String> selectedCountryList =[];
    for( int index = 0; index<listOfCountryFields.length; index++){
      if(listOfCountryFields[index].isSelected==true){
        selectedCountryList.add(listOfCountryFields[index].countryName);
      }
    }
    return selectedCountryList.join(" ,");
  }

  String getInterestedWork(){
    List<String> selectedInterestedWork = [];
    for(int i=0;i<listOfWorkFields.length; i++){
      if(listOfWorkFields[i].isSelected==true){
        selectedInterestedWork.add(listOfWorkFields[i].jopName);
      }
    }
    return selectedInterestedWork.join(" ,");
  }

  onTap(context){
    if(currentindex==0){
      pageview_controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }else if (currentindex==1){
      creatAccount(context);
    }else if (currentindex == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()));
    }
  }

  creatAccount(context){
    UpdateProfileUseCase().call(
        UpdateProfileParams(
           getInterestedWork(),
            selectedCountry(),
            getWorkType())
               ).then((value) => value.bimap(
            (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.message)));
            },
            (success) {
              if(success.status==true){
                pageview_controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                print(getInterestedWork());
                print(selectedCountry());
                print(getWorkType());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context)=>HomeScreen()));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Somthing went wrong"))
                );
              }
            })
    );
  }

  OnChangePage(index) {
  currentindex = index;
 emit(PickjobInitial());
  }
}

class WorkField {
  String image;
  String jopName;
  bool isSelected;
  WorkField({required this.image,required this.jopName,required this.isSelected});
}

class CountryField {
  String image;
  String countryName;
  bool isSelected;
  CountryField({required this.image,required this.countryName,required this.isSelected});
}

class WorkType {
  String workType;
   int? tabTextIndexSelected;
  bool isSelected;
  WorkType({required this.workType,required this.isSelected,this.tabTextIndexSelected});
}