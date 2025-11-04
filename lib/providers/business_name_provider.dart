import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_name_provider.g.dart';

@riverpod
class BusinessName extends _$BusinessName {
  @override
  String build() {
    return 'Yellow Clothing';
  }

  void setBusinessName(String newBusinessName) {
    state = newBusinessName;
  }
}
