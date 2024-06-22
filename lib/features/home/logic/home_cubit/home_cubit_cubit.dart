import 'package:aflami/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitialState());

  Future<void> getUserData() async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      final getCollection =
          FirebaseFirestore.instance.collection('users').doc(uid);
      final docSnapshot = await getCollection.get();
      if (docSnapshot.exists) {
        final userData = docSnapshot.data();
        emit(HomeCubitSuccessState(userModel: UserModel.fromJson(userData!)));
      } else {
        emit(HomeCubitFailureState(errorMessage: 'No Data Found'));
      }
    } catch (e) {
      emit(HomeCubitFailureState(errorMessage: e.toString()));
    }
  }
}
