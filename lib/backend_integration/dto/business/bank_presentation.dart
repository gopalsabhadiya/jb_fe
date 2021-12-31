import 'package:jb_fe/backend_integration/domain/entities/business/bank.dart';

class BankPresentation {
  String id;
  String name;
  int accountNo;
  String ifsc;
  String branch;

  BankPresentation(BankEntity entity)
      : id = entity.id,
        name = entity.name,
        accountNo = entity.accountNo,
        ifsc = entity.ifsc,
        branch = entity.branch,
        super();

  BankEntity getEntity() {
    return BankEntity(
      id: id,
      name: name,
      accountNo: accountNo,
      ifsc: ifsc,
      branch: branch,
    );
  }

  @override
  String toString() {
    return 'BankPresentation{id: $id, name: $name, accountNo: $accountNo, ifsc: $ifsc, branch: $branch}';
  }
}
