extension ParseToString on PartyTypeEnum {
  String name(){
    switch(this){

      case PartyTypeEnum.Customer:
        return "Customer";
      case PartyTypeEnum.Retail:
        return "Retail";
    }
  }
}
enum PartyTypeEnum { Customer, Retail }
