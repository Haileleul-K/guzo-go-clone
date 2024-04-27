import 'package:guzo_go_demo/core/controllers/homepage_controller.dart';

import 'package:guzo_go_demo/core/services/caching_service.dart';
import 'package:guzo_go_demo/core/services/profile_service.dart';
import 'package:get_it/get_it.dart';



GetIt sl = GetIt.instance;

setupLocator(){
  //Add all services and controllers here!!!!

  // sl.registerLazySingleton(() => ApiService());
  sl.registerLazySingleton(() => CachingService());

  sl.registerLazySingleton(() => ProfileService());

  sl.registerLazySingleton(()=>HomePageController());
 
 
}
