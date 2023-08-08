import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormStateExample> {
  FormBloc() : super(InitialState()) {
    on<ValidateFormEvent>((event, emit) {

      String? myName;
      if(event.userCtr.text.isEmpty){
          myName = "Name Error";
      }
      String? myEmail;
      if(event.emailCtr.text.isEmpty){
        myEmail = "Email error";
      }
      String? myPswd;
      if(event.pswdCtr.text.isEmpty){
        myPswd = "Password error";
      }

      if (myName == null && myEmail == null && myPswd == null) {
        emit(FormValidState());
      } else {
        emit(FormValidationState(myName, myEmail, myPswd));
      }

    });
  }
}
