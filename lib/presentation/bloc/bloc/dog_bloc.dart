import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/domain/models/errors.dart';
import 'package:appnation_casestudy/domain/repositories/dog_repo_abstract.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final IDogRepo repo;
  DogBloc({required this.repo}) : super(DogInitial()) {
    on<FetchData>((event, emit) async {
      emit(SplashLoading());
      // await repo.getAllBreeds().fold(
      //     (left) => emit(
      //           Failure(dogList: [], error: CustomException.now(message: left.error)),
      //         ),
      //     (right) => emit(DogInitial(dogList: right)));

      List<DogModel> data = await repo.getAllBreeds();

      emit(DataLoaded(dogList: data));
    });
    on<GenerateImage>((event, emit) async {
      emit(Loading(dogList: state.dogList));
      // await repo.generateRandomImage(event.breed).fold(
      //     (left) => Failure(
      //           dogList: state.dogList,
      //           error: CustomException.now(message: left.error),
      //         ),
      //     (right) => emit(DogInitial(dogList: state.dogList, generatedImage: right)));

      String img = await repo.generateRandomImage(event.breed);
      emit(DataLoaded(dogList: state.dogList, generatedImage: img));
    });
  }
}
