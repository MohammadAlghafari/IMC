part of 'tech_marque_cubit.dart';

@immutable
abstract class TechMarqueState {
  const TechMarqueState();
}

class TechMarqueInitial extends TechMarqueState {
  const TechMarqueInitial();
}

// State when the tech marque are loading
class FetchingTechMarque extends TechMarqueState {
  const FetchingTechMarque();
}

class TechMarqueFetched extends TechMarqueState {
  final List<techMarqueModel.Records>? techMarque;
  const TechMarqueFetched(this.techMarque);
}

class FetchingTechMarqueError extends TechMarqueState {
  final String errorMessage;
  const FetchingTechMarqueError(this.errorMessage);
}
