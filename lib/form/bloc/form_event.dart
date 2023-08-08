part of 'form_bloc.dart';

@immutable
abstract class FormEvent {}

class ValidateFormEvent extends FormEvent{
  TextEditingController userCtr;
  TextEditingController emailCtr;
  TextEditingController pswdCtr;

  ValidateFormEvent(this.userCtr, this.emailCtr, this.pswdCtr);
}
