import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>( context );
    final authService    = Provider.of<AuthService>( context, listen: false );

    if( productService.isLoading ) return LoadingScreen();

    return Scaffold(

      appBar: AppBar(
        title: Text( 'Productos' ),
        leading: IconButton(
          icon: Icon( Icons.logout_outlined ),
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed( context, 'login' );
          }
        ),

        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.products[ index ].copy();
            Navigator.pushNamed( context, 'product' );
          },
          child: ProductCard(
            product: productService.products[ index ]
          )
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          productService.selectedProduct = Product(
            available: false, 
            name: '', 
            price: 0
          );

          Navigator.pushNamed( context, 'product' );
        },
      ),
   );
  }
}