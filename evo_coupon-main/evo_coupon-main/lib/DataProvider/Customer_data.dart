import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:evocoupon/Model/Customer.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CustomerDataProvider {
  final _baseUrl = 'http://10.0.133.192:5219/api/customers';
  final http.Client httpClient;

  CustomerDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<Customer> createCustomer(Customer customer) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "phoneNum": customer.PhoneNum,
        "plateNumber": customer.PlateNumber,
        "email": customer.Email,
      }),
    );

    if (response.statusCode == 200) {
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Customer>> getCustomer() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl'));
      if (response.statusCode == 200) {
        final services = jsonDecode(response.body) as List;
        return services.map((customer) => Customer.fromJson(customer)).toList();
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception thrown $e");
    }
    throw Exception('Failed test');
  }

  Future<void> deleteCustomer(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('$_baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateCustomer(Customer Customer) async {
    final http.Response response = await httpClient.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "CustomerId": Customer.id,
        "PhoneNum": Customer.PhoneNum,
        "PlateNumber": Customer.PlateNumber,
        "Email": Customer.Email,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update course.');
    }
  }
}
