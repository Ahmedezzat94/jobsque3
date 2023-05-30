import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'complete_profile_state.dart';


class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());
  static CompleteProfileCubit get(context)=> BlocProvider.of(context);

  int get currentStep  {
    return
    step1+step2+step3+step4;
  }

  int step1 = 0;
  int step2 = 0;
  int step3 = 0;
  int step4 = 0;

  //Pages FormKeys.
  var personalDetailsformKey = GlobalKey<FormState>();
  var educationformKey = GlobalKey<FormState>();
  var expereienceformKey = GlobalKey<FormState>();
  var portofolioformKey = GlobalKey<FormState>();

  //Pesonal Details Controllers.
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController phontNumController = TextEditingController();

  //Education Controllers.
  TextEditingController universityController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController startyearController = TextEditingController();
  TextEditingController endyearController = TextEditingController();

 //Experience Controllers.
  TextEditingController positionController = TextEditingController();
  TextEditingController typeofworkController = TextEditingController();
  TextEditingController componynameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController yearStartController = TextEditingController();

  bool personalDetailsisSelected = false;
  bool educationisSelected = false;
  bool expereienceIsSelected = false;
  bool portofolioIsSelected = false;
  bool isBoxChecked = false;


  onCheckBoxTap(){
    isBoxChecked = !isBoxChecked;
    emit(BoxChecked());
  }

  onPersonDetailsValidate(context){
    if(personalDetailsformKey.currentState!.validate()){
      step1 = 1;

    }else{
      step1 = 0;
    }
    emit(OnStepVerify());
    emit(CompleteProfileInitial());
  }

  onEducationValidate(context){
    if(educationformKey.currentState!.validate()){
      step2 = 1;

    }else {
      step2 = 0;
    }
    emit(OnStepVerify());
    emit(CompleteProfileInitial());
  }


  onExperienceValidate(context){
    if(expereienceformKey.currentState!.validate()){
      step3 = 1;

    }else{
      step3 = 0;
    }
    emit(OnStepVerify());
    emit(CompleteProfileInitial());
  }

//pick files from device.
  FilePickerResult? result;     // this is what comes from the device to upload it.
  String? fileName;            // get the file name and save it in here.
  PlatformFile? pickedFile;   // to pick the file and save it in here.
  bool isLoading = false;    // to show a progress indicator when we uploading the file.
  late File fileToDisplay;      // to convert the picked file from platform type to File type.
  List<File> files = [];
  pickFile()async{
    try{
      result = await FilePicker.platform.pickFiles(
        type:FileType.image,
        allowMultiple:false,
        allowedExtensions: [],
      );
      if(result != null){
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        files.add(fileToDisplay!);
        print( files);
        step4 = 1;
      }else{
        step4 = 0;
      }
      emit(OnStepVerify());
      emit(CompleteProfileInitial());
    }catch(e){
      print(e);
    }
  }

  removeFile(index){
    files.removeAt(index);
    if(files.isEmpty)
    step4 = 0;
    emit(CompleteProfileInitial());  }
}