import 'package:aflami/core/networking/api_service.dart';
import 'package:aflami/features/home/data/repos/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final gitIt=GetIt.instance;

void diSetup(){
  gitIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: ApiService()));
}