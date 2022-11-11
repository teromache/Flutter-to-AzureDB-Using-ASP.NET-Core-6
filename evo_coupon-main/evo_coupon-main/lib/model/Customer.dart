import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';




@immutable
class Customer extends Equatable{
  final  int  id;
  final String PlateNumber;
  final String PhoneNum;
  final String Email;
  



  const Customer({
    @required this.id,
    @required this.PhoneNum,
    @required this.Email,
    @required this.PlateNumber ,


  });

  @override
  List<Object> get props => [id, PhoneNum, PlateNumber, Email];

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['customerId'],
      PhoneNum: json['phoneNum'],
      PlateNumber: json['plateNumber'],
      Email: json ['email'],
    );
  }

  @override
  String toString() => 'Customer { id: $id, PhoneNum: $PhoneNum, PlateNumber: $PlateNumber, Email: $Email }';
}


