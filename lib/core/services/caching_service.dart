import 'package:get_storage/get_storage.dart';
class CachingService {

  GetStorage box = GetStorage();

  void save(String key, String value){
    box.write('key', 'value');
  }

  void clear(){
    box.erase();
  }
}