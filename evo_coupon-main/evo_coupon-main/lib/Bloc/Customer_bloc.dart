import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/Bloc/bloc.dart';
import 'package:evocoupon/Repository/Customer_repository.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc({@required this.customerRepository})
      : assert(customerRepository != null),
        super(CustomerLoading());

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    if (event is CustomerLoad) {
      print("Customer load method");
      yield CustomerLoading();

      try {
        final customers = await customerRepository.getCustomers();
        print("This is the customer $customers");
        yield CustomersLoadSuccess(customers);
      } catch (_) {
        yield CustomerOperationFailure();
      }
    }

    if (event is CustomerCreate) {
      try {
        await customerRepository.createCustomer(event.customer);
        final customers = await customerRepository.getCustomers();
        yield CustomersLoadSuccess(customers);
      } catch (_) {
        yield CustomerOperationFailure();
      }
    }

    if (event is CustomerUpdate) {
      try {
        await customerRepository.updateCustomer(event.customer);
        final customers = await customerRepository.getCustomers();
        yield CustomersLoadSuccess(customers);
      } catch (_) {
        yield CustomerOperationFailure();
      }
    }

    if (event is CustomerDelete) {
      try {
        await customerRepository.deleteCustomer(event.customer.id);
        final customers = await customerRepository.getCustomers();
        yield CustomersLoadSuccess(customers);
      } catch (e) {
        print("Error delete=$e");
        yield CustomerOperationFailure();
      }
    }
  }
}
