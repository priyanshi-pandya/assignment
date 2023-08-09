part of 'form_bloc.dart';

@immutable
abstract class FormStateExample {}

class InitialState extends FormStateExample {}

class FormValidState extends FormStateExample {}

class FormValidationState extends FormStateExample {
  String? name;
  String? email;
  String? pswd;
  String? city;
  String? state;
  String? country;

  FormValidationState(
    this.name,
    this.email,
    this.pswd,
    this.city,
    this.state,
    this.country,
  );
}
