part of 'form_bloc.dart';

@immutable
abstract class FormEvent {}

class ValidateFormEvent extends FormEvent {
  TextEditingController userCtr;
  TextEditingController emailCtr;
  TextEditingController pswdCtr;
  TextEditingController cityCtr;
  TextEditingController stateCtr;
  TextEditingController countryCtr;

  ValidateFormEvent(
    this.userCtr,
    this.emailCtr,
    this.pswdCtr,
    this.cityCtr,
    this.stateCtr,
    this.countryCtr,
  );
}
