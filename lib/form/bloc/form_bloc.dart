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
      if (event.userCtr.text.isEmpty) {
        myName = "Name field is empty";
      }
      String? myEmail;
      if (event.emailCtr.text.isEmpty) {
        myEmail = "Email field is empty";
      }
      String? myPswd;
      if (event.pswdCtr.text.isEmpty) {
        myPswd = "Password field is empty";
      }

      String? myCity;
      if (event.cityCtr.text.isEmpty) {
        myCity = "City name is empty";
      }
      String? myState;
      if (event.stateCtr.text.isEmpty) {
        myState = "State name is empty";
      }
      String? myCountry;
      if (event.countryCtr.text.isEmpty) {
        myCountry = "Country name is empty";
      }

      if (myName == null &&
          myEmail == null &&
          myPswd == null &&
          myCity == null &&
          myState == null &&
          myCountry == null) {
        emit(FormValidState());
      } else {
        emit(
          FormValidationState(
            myName,
            myEmail,
            myPswd,
            myCity,
            myState,
            myCountry,
          ),
        );
      }
    });
  }
}
