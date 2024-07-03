
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/Models/user_model.dart';
import 'package:gemini_app/Screens/Authentication/login_screen.dart';
import 'package:gemini_app/Shared/Constants/data.dart';
import 'package:gemini_app/Shared/Core/app_navigator.dart';
import 'package:gemini_app/Shared/Core/app_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  var nameController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  // Edit Name
  var editEnabled = false;

  void changeEditMode() {
    editEnabled = !editEnabled;
    emit(ChangeEditState());
  }

  // Get User
  UserModel? user, backupUser;
  void getUser() async {
    emit(LoadingGetUserState());
    try {
      final document = await _firestore
      .collection("Users")
      .doc(uId)
      .get();
      user = UserModel.fromJson(document.data()!);
      backupUser = user!.clone();
      emit(SuccessGetUserState());
    } catch (e) {
      emit(FailedGetUserState(e.toString()));
      print(e.toString());
    }
  }

  // Update User
  Future<void> updateUser() async {
    try {
      await _firestore
      .collection("Users")
      .doc(uId)
      .update(user!.toJson());
      backupUser = user!.clone();
    } catch (e) {
      user = backupUser!.clone();
      throw "Failed to Update User";
    }
  }

  // Change Name
  void changeName() async {
    if (nameController.text == user!.name) {
      changeEditMode();
      return;
    }
    try {
      emit(LoadingChangeNameState());
      user!.name = nameController.text;
      await updateUser();
      emit(SuccessChangeNameState());
    } catch (e) {
      emit(FailedChangeNameState(e.toString()));
      print(e.toString());
    } finally {
      changeEditMode();
    }
  }

  
  // Pick Image
  Future<XFile?> pickImage() async {
    emit(PickingImageState());
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(SuccessPickingImageState());
    return image;
  }

  // Upload Picture
  void changePicture() async {
    final XFile? image = await pickImage();
    if (image!=null) {
      emit(LoadingChangePictureState());
      try {
      final file = await _firebaseStorage
      .ref()
      .child("Users/$uId/${image.name}")
      .putFile(File(image.path));
      final url = await file.ref.getDownloadURL();
      user!.profilePicture = url;
      updateUser();
      emit(SuccessChangePictureState());
      } catch (e) {
        emit(FailedChangePictureState(e.toString()));
        print(e.toString());
      }
    }
  }

  // Logout
  void logout() async {
    await _auth.signOut();
    uId = null;
    user = null;
    backupUser = null;
    emit(LogoutState());
  }

}
