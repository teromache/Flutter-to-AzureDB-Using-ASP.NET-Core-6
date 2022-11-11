import 'package:equatable/equatable.dart';
import 'package:evocoupon/Service.dart';


class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}
class CustomerLoading extends CustomerState {}

class CustomersLoadSuccess extends CustomerState{
  final List<Customer> customers;

  CustomersLoadSuccess([this.customers = const []]);

  @override
  List<Object> get props => [customers];
}

class CustomerOperationFailure extends CustomerState {}
