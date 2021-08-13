
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
  
 void main() => runApp(AppState());

 class AppState extends StatelessWidget {
   const AppState({ Key? key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MultiProvider(
       providers: [
         ChangeNotifierProvider( create: ( _ ) => ProductsService() )

       ],
       child: MyApp(),       
     );
   }
 }
  
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'ProductosApp',
       initialRoute: 'login',
       routes: {
         'login'    : ( _ ) => LoginScreen(),
         'register' : ( _ ) => RegisterScreen(),
         'home'     : ( _ ) => HomeScreen(),
         'product'  : ( _ ) => ProductScreen(),
       },
       theme: ThemeData.light().copyWith(
         scaffoldBackgroundColor: Colors.grey[ 300 ],

         appBarTheme: AppBarTheme(
           elevation: 0,
           color: Colors.indigo
         ),

         floatingActionButtonTheme: FloatingActionButtonThemeData(
           backgroundColor: Colors.indigo,
           elevation: 0
         ),
       ),
     );
   }
 }