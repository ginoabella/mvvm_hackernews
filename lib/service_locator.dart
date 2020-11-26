import 'package:get_it/get_it.dart';
import 'package:hacker_news/services/data_service.dart';
import 'package:hacker_news/services/webservice.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<DataService>(() => Webservice());
}
