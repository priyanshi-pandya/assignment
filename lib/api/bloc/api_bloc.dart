import 'package:bloc/bloc.dart';
import '../api_service/fetch_data.dart';
import '../modal/image_modal.dart';

abstract class DataEvent {}

class FetchDataEvent extends DataEvent {}

abstract class DataState {}

class InitialDataState extends DataState {}

class LoadedDataState extends DataState {
  final ImageDataFromPexel data;

  LoadedDataState(this.data);
}

class ErrorDataState extends DataState {
  final String error;

  ErrorDataState(this.error);
}

class APIBLoc extends Bloc<DataEvent, DataState> {
  Repository repository = Repository();

  APIBLoc() : super(InitialDataState()) {
    on<FetchDataEvent>(
      (event, emit) async {
        emit(InitialDataState());
        print("intial data state");
        try {
          final data = await repository.fetchData();
          print(data?.photos);
          emit(LoadedDataState(data!));
          print("emmited");
        } catch (e) {
          emit(ErrorDataState(e.toString()));
          print("error");
        }
      },
    );
  }
}
