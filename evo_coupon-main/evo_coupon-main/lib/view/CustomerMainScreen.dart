import 'package:evocoupon/view/CustomerCreateUpdateScreen.dart';
import 'package:evocoupon/view/ScreenRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evocoupon/Bloc/bloc.dart';
import 'package:evocoupon/view/CustomerDetailScreen.dart';
//import 'package:evocoupon/Screen/ServiceCreateUpdateScreen.dart';
import 'package:evocoupon/view/screen.dart';
import 'dart:math';

//import 'CustomerCreateUpdateScreen.dart';

class CustomerMainScreen extends StatelessWidget {
  const CustomerMainScreen({Key key}) : super(key: key);

  static const routeName = '/test_screen';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        '${text}',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(6);

    print(randomNumber);

    return Scaffold(
        appBar: AppBar(title: Text('Category Name'), actions: [
          PopupMenuButton(
              icon: Icon(Icons.refresh),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Refresh'),
                      value: () {},
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: null,
                    ),
                  ]),
        ]),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: double.infinity,
              child: Image.asset("assets/images/wood.jpg"),
            ),
//           ingredient
            buildSectionTitle(context, 'Test'),

            BlocBuilder<CustomerBloc, CustomerState>(builder: (_, state) {
              if (state is CustomerOperationFailure) {
                return Text('Could not do Customer  operation');
              }
              if (state is CustomersLoadSuccess) {
                final customers = state.customers;
                return buildContainer(
                    context,
                    ListView.builder(
                        itemCount: customers.length,
                        itemBuilder: (ctx, index) => Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(20)),
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                margin: EdgeInsets.all(4),
                                padding: EdgeInsets.all(4),
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 5),
                                  child: Center(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/fixit.png'),
                                      ),
                                      title: Text(
                                        customers[index].PlateNumber != null
                                            ? customers[index].PlateNumber
                                            : "place holder test",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      subtitle: Text(
                                        customers[index].PlateNumber != null
                                            ? customers[index].PlateNumber
                                            : "Place holder",
                                      ),
                                      trailing:
                                          MediaQuery.of(context).size.width >
                                                  450
                                              ? TextButton.icon(
                                                  icon: Icon(
                                                    Icons.delete_forever,
                                                    color: Theme.of(context)
                                                        .errorColor,
                                                  ), onPressed: () {  }, label: Text(''),
                                                )
                                              : IconButton(
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: Theme.of(context)
                                                        .errorColor,
                                                  ), onPressed: () {  },
                                                ),
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(CustomerDetail.routeName,
                                              arguments: customers[index]),
                                    ),
                                  ),
                                ),
                              )
                            ])));
              }
              return CircularProgressIndicator();
            }),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(
            AddUpdateCustomer.routeName,
            arguments: CustomerArgument(editCust: false),
          ),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {
                    print("search icon button have been clicked");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.note),
                  color: Colors.white,
                  onPressed: () {
                    print("the note icon button have been clicked");
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceMainScreen()));
                  },
                )
              ]),
        ));
  }
}
