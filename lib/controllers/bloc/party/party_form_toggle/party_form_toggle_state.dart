part of 'party_form_toggle_cubit.dart';

abstract class ToggleForParty extends Equatable {
  const ToggleForParty();
}

class ToggleForPartyUpdate extends ToggleForParty {
  final PartyPresentation partyToBeUpdated;

  const ToggleForPartyUpdate({required this.partyToBeUpdated});

  @override
  List<Object?> get props => [partyToBeUpdated];
}

class ToggleForNewParty extends ToggleForParty {
  const ToggleForNewParty();
  @override
  List<Object?> get props => [];
}

class DoNotToggle extends ToggleForParty {
  const DoNotToggle();
  @override
  List<Object?> get props => [];
}

class PartyFormToggleState extends Equatable {
  final ToggleForParty toggleForParty;
  const PartyFormToggleState({
    this.toggleForParty = const DoNotToggle(),
  });

  @override
  List<Object?> get props => [toggleForParty];
}
