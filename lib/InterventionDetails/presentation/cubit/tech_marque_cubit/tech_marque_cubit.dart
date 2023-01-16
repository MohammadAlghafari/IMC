import 'package:bloc/bloc.dart';
import 'package:imc/InterventionDetails/data/models/tech_marque_model.dart' as techMarqueModel;
import 'package:imc/InterventionDetails/data/repositories/InterventionDetailsRepository.dart';
import 'package:meta/meta.dart';

part 'tech_marque_state.dart';

class TechMarqueCubit extends Cubit<TechMarqueState> {
  // injecting InterventionDetailsRepository;
  InterventionDetailsRepository _interventionDetailsRepository;
  TechMarqueCubit(this._interventionDetailsRepository) : super(TechMarqueInitial());


  ///[getListOfTechMarque] function fetch list of tech marque (Meter Brand) from the api
  Future<void> getListOfTechMarque() async{
    try{
      emit(FetchingTechMarque());
      final techMarque = await _interventionDetailsRepository.getListOfTechMarques();
      emit(TechMarqueFetched(techMarque?.records));
    }
    catch(E){
      emit(FetchingTechMarqueError("An Error Occurred while fetching Tech Marque"));
    }
  }


  /// [changeTechMarqueState] will change the page state
  void changeTechMarqueState(TechMarqueState state){
    emit(state);
  }

  void resetCubit(){
    emit(TechMarqueInitial());
  }
}