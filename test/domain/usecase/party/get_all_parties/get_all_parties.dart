// import 'package:flutter_test/flutter_test.dart';
// import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
// import 'package:jb_fe/backend_integration/domain/entities/party.dart';
// import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
// import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'get_all_parties.mocks.dart';
//
// @GenerateMocks([PartyRepository])
// void main() {
//   late GetPartyPageUseCase getPartyPage;
//   late MockPartyRepository mockPartyRepository;
//
//   setUp(() {
//     mockPartyRepository = MockPartyRepository();
//     getPartyPage = GetPartyPageUseCase(repository: mockPartyRepository);
//   });
//
//   List<PartyEntity> getParties() {
//     PartyEntity p1 = PartyEntity(
//       id: "kjafghiusoaf",
//       partyId: 1,
//       name: "Gopal Sabhadiya",
//       contactNo: "8000523940",
//       balance: 250,
//       type: PartyTypeEnum.Customer,
//       user: "ajkshdkajshdfkja",
//       business: "lkjsadhfjshakdfjhs",
//       date: DateTime.now(),
//     );
//     PartyEntity p2 = PartyEntity(
//       id: "kjafghiusoaf",
//       partyId: 2,
//       name: "Hasti Gondaliya",
//       contactNo: "9638233690",
//       balance: 2500,
//       type: PartyTypeEnum.Retail,
//       user: "ajkshdkajshdfkja",
//       business: "lkjsadhfjshakdfjhs",
//       date: DateTime.now(),
//     );
//     return [p1, p2];
//   }
//
//   test(
//     "Should get all parties from repository",
//     () async {
//       //arrange
//       when(mockPartyRepository.getPartyPage(1))
//           .thenAnswer((_) async => getParties());
//       //act
//       final result = await getPartyPage(1);
//       //assert
//       verify(mockPartyRepository.getAllParties());
//       expect(result, getParties());
//     },
//   );
// }
