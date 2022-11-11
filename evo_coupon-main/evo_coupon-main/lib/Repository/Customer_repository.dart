import 'package:evocoupon/Dataprovider/Customer_data.dart';
import 'package:evocoupon/Model/Customer.dart';
import 'package:meta/meta.dart';
//import '../Service.dart';

class CustomerRepository {
  final CustomerDataProvider dataProvider;

  CustomerRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Customer> createCustomer(Customer customer) async {
    return await dataProvider.createCustomer(customer);
  }

  Future<List<Customer>> getCustomers() async {
    print("This is the getCustomer method");
    return await dataProvider.getCustomer();
  }

  Future<void> updateCustomer(Customer customer) async {
    await dataProvider.updateCustomer(customer);
  }

  Future<void> deleteCustomer(int  id) async {
    await dataProvider.deleteCustomer(id);
  }
}
