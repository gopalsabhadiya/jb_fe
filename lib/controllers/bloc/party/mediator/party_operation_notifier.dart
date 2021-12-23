import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';

abstract class PartyOperationNotifier {
  PartyBloc? _subscriber;

  void subscribe({required PartyBloc subscriber}) {
    print("Subscribing: $subscriber");
    _subscriber = subscriber;
  }

  void unSubscribe() {
    _subscriber = null;
  }

  void notifySubscriber({String? deleteId, PartyPresentation? updatedParty}) {
    if (this is DeletePartyBloc) {
      _subscriber!.add(RemoveParty(partyId: deleteId!));
    } else if (this is UpdatePartyBloc) {
      print("Notify subscriber of Party Updated: $updatedParty");
    }
  }
}
