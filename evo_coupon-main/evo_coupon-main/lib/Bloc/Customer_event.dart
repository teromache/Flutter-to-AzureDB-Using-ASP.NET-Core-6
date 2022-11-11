import 'package:equatable/equatable.dart';
import 'package:evocoupon/Model/Customer.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class CustomerLoad extends CustomerEvent {
  const CustomerLoad();

  @override
  List<Object> get props => [];
}

class CustomerCreate extends CustomerEvent {
  final Customer customer;

  const CustomerCreate(this.customer);

  @override
  List<Object> get props => [customer];

  @override
  String toString() => 'Customer Created {customer: $customer}';
}

class CustomerUpdate extends CustomerEvent {
  final Customer customer;

  const CustomerUpdate(this.customer);

  @override
  List<Object> get props => [customer];

  @override
  String toString() => 'Customer Updated {customer: $customer}';
}

class CustomerDelete extends CustomerEvent {
  final Customer customer;

  const CustomerDelete(this.customer);

  @override
  List<Object> get props => [customer];

  @override
  toString() => 'Customer Deleted {customer: $customer}';
}
