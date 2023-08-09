import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/UI/main_dashboard.dart';
import '../bloc/form_bloc.dart';

class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);
  final userCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final pswdCtr = TextEditingController();
  final cityCtr = TextEditingController();
  final stateCtr = TextEditingController();
  final countryCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
          centerTitle: true,
        ),
        body: BlocBuilder<FormBloc, FormStateExample>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      autofocus: true,
                      controller: userCtr,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText:
                              state is FormValidationState ? state.name : null,
                          border: const OutlineInputBorder(),
                          labelText: "Enter name"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: emailCtr,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText:
                              state is FormValidationState ? state.email : null,
                          border: const OutlineInputBorder(),
                          labelText: "Enter Email"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: pswdCtr,
                      obscureText: true,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText:
                              state is FormValidationState ? state.pswd : null,
                          border: const OutlineInputBorder(),
                          labelText: "Enter Password"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      autofocus: true,
                      controller: cityCtr,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText:
                              state is FormValidationState ? state.city : null,
                          border: const OutlineInputBorder(),
                          labelText: "Enter city"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: stateCtr,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText:
                              state is FormValidationState ? state.state : null,
                          border: const OutlineInputBorder(),
                          labelText: "Enter State"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: countryCtr,
                      obscureText: true,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText: state is FormValidationState
                              ? state.country
                              : null,
                          border: const OutlineInputBorder(),
                          labelText: "Enter Country"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<FormBloc>(context).add(
                            ValidateFormEvent(userCtr, emailCtr, pswdCtr,
                                cityCtr, stateCtr, countryCtr),
                          );

                          if (state is FormValidState) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardMainScreen(),
                              ),
                            );
                          }
                        },
                        child: const Text("Submit Data"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
