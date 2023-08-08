import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/UI/main_dashboard.dart';
import '../bloc/form_bloc.dart';

class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);
  final userCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final pswdCtr = TextEditingController();

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
            return Padding(
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<FormBloc>(context)
                            .add(ValidateFormEvent(userCtr, emailCtr, pswdCtr));

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
            );
          },
        ),
      ),
    );
  }
}
