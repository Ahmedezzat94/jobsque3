import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';
import '../../pages/job_details_pages/company_page.dart';
import '../../pages/job_details_pages/desiciption_page.dart';
import '../../pages/job_details_pages/people_page.dart';
import '../../screens/home_screens/job_apply_screen.dart';
import '../../screens/home_screens/job_details_screen.dart';
part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());

  static JobDetailsCubit get(context) => BlocProvider.of(context);

  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  PageController pageViewController = PageController();
  SelectorConfig selectorConfig = const SelectorConfig();
  var formKey = GlobalKey<FormState>();


  void initial(){
    name_controller.clear();
    email_controller.clear();
    phone_controller.clear();
    currentIndex = 0;
    isSelected = null;
    pickedFile = null;
  }


  navigateToJobDetails(context,SuggestedJob suggestedJob){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>JobDetailsScreen(suggestedJob:suggestedJob,))
    );
    emit(JobDetailsInitial());
  }
  navigateToApplyJob(context){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>JobApplyScreen())
    );
    emit(PageJobApplyInitial());
  }



  int currentIndex = 0;
  onPageViewChange(index){
    currentIndex = index;
    emit(PageScroller());
  }

  int? isSelected = null;
  onJobFieldTap(int index){
    isSelected = index;
    emit(IsSelected());
  }


  onNameFieldChange() {
    if (formKey.currentState!.validate())
      emit(FieldIsNotEmpty());
    else{
      emit(FieldIsEmpty());
    }
  }

  onEmailFieldChange() {
    if (formKey.currentState!.validate())
      emit(FieldIsNotEmpty());
    else{
      emit(FieldIsEmpty());
    }
  }

  onPhoneFieldChange() {
    if (formKey.currentState!.validate())
      emit(FieldIsNotEmpty());
    else{
      emit(FieldIsEmpty());
    }
  }

 static  SuggestedJob? suggestedJob = SuggestedJob();


  int textButtonTap = 0;
   List get pages => [
    DisicriptionPage(job_description: '${suggestedJob?.jobDescription}', job_skill: '${suggestedJob?.jobSkill}',),
    CompanyPage(aboutCompany: '${suggestedJob?.aboutComp}', email: '${suggestedJob?.compEmail}', webSite: '${suggestedJob?.compWebsite}',),
    PeoplePage()
  ];
  onButtonTap(index){
    textButtonTap = index ;
    pages.elementAt(index);
    emit(ToggelButtonIncrement());
  }

  //pick files from device.
  FilePickerResult? result;     // this is what comes from the device to upload it.
  String? fileName;            // get the file name and save it in here.
  PlatformFile? pickedFile;   // to pick the file and save it in here.
  bool isLoading = false;    // to show a progress indicator when we uploading the file.
  File? fileToDisplay;      // to convert the picked file from platform type to File type.

  pickFile()async{
    try{
      emit(iSLoading());
    result = await FilePicker.platform.pickFiles(
      type:FileType.image,
       allowMultiple:false,
       allowedExtensions: [],
    );
   emit(isNotLoading());
    if(result != null){
      fileName = result!.files.first.name;
      pickedFile = result!.files.first;
      fileToDisplay = File(pickedFile!.path.toString());
      print("File name $fileName");
      emit(uploadSuccess());
    }
    }catch(e){
      print(e);
    }
  }

}
