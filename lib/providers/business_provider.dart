import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_provider.g.dart';

class BusinessModel {
  final String name;
  final String brand;

  const BusinessModel(
    this.name,
    this.brand,
  );
}

List<BusinessModel> allBusinessList = [
  const BusinessModel('Yellow', 'Clothing'),
  const BusinessModel('Bata', 'Shoe'),
];

@riverpod
class Business extends _$Business {
  @override
  List<BusinessModel> build() {
    return allBusinessList;
  }

  void addNewBusiness(BusinessModel newBusiness) {
    state = [...state, newBusiness];
  }

  void removeBusiness(String businessName) {
    state = state.where((business) => business.name != businessName).toList();
  }
}
