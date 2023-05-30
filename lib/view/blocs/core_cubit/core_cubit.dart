import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../../data/data source/jobs_local_data_source/jobs_local_data_source.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreInitial());

  static CoreCubit get(context) => BlocProvider.of(context);

  appInit(){
    AuthLocalDataSourceImpl2().dbInit();
    JobsLocalDataSourceImpl().initDB();
  }


}
