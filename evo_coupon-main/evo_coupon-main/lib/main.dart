import 'package:evocoupon/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/constants/routes.dart';
import 'theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evocoupon/Bloc/bloc.dart';
import 'package:evocoupon/Dataprovider/Customer_data.dart';
import 'package:evocoupon/Repository/repository.dart';
import 'package:evocoupon/bloc_observer.dart';
import 'package:provider/provider.dart';
import 'package:evocoupon/providers/usuario_provider.dart';

import 'package:http/http.dart' as http;

import 'Dataprovider/data_provider.dart';
import 'view/screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = SimpleBlocObserver();

  CustomerDataProvider customerDataProvider = CustomerDataProvider(
    httpClient: http.Client(),
  );
  final CustomerRepository customerRepository =
      CustomerRepository(dataProvider: customerDataProvider);

  runApp(
    FixIt(
      customerRepository: customerRepository,
    ),
  );
}

class FixIt extends StatelessWidget {
  final CustomerRepository customerRepository;

  const FixIt({Key key, @required this.customerRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerBloc>(
          create: (_) => CustomerBloc(
            customerRepository: customerRepository,
          )..add(CustomerLoad()),
        ),
      ],
      child: MyApp(),
    );
    /*
    return RepositoryProvider.value(
      value: this.courseRepository,
      child: BlocProvider(
        create: (context) => CourseBloc(courseRepository: this.courseRepository)
          ..add(CourseLoad()),
        child: MaterialApp(
          title: 'Course App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: CourseAppRoute.generateRoute,
        ),
      ),
    );
    */
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Usuario_provider()),
      ],
      child: MaterialApp(
        theme: theme(),
        initialRoute: loginRoute,
        routes: {
          paymentRoute: (context) => const PaymentScreen(
              //harga_Coupon: '',
              ),
          loginRoute: (context) => LoginScreen(),
          homeRoute: (context) => const HomeScreen(),
          dailysaleRoute: (context) => const DailySaleScreen(),
        },
        onGenerateRoute: ServiceAppRoute.generateRoute,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => LoginScreen());
        },
      ),
    );
  }
}
