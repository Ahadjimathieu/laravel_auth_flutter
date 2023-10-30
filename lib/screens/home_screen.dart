import 'package:flutter/material.dart';
import 'package:okpa_front/screens/login_screen.dart';
import 'package:okpa_front/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart' as Dio;
import '../services/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

 
  @override
  
  State<HomeScreen> createState() => _HomeScreenState();

  
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluuter auth laravel'),
      ),
        
      // ignore: prefer_const_constructors
      body: Center(
        // ignore: prefer_const_constructors
        child: Text('Home Screen'),
      ),
      drawer: Drawer(
          child: Consumer<Auth>(builder: (context, auth, child) {
            if(!auth.authenticated){
               return ListView(
                  children: [
                     ListTile(
                        title: Text('Connexion'),
                        leading: Icon(Icons.login),
                        onTap: () {
                          // Action à effectuer lorsque l'élément du menu est cliqué
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },
                      ),
                  ],
               );
            }else{
                return ListView(
                    children: [
                         DrawerHeader(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                              ),
                              const SizedBox(height: 10,),
                              Text('${auth.user.firstname} ${auth.user.lastname}', style: const TextStyle(color: Colors.white),),
                             const  SizedBox(height: 10,),
                              Text(auth.user.email, style: const TextStyle(color: Colors.white),)
                            ],
                          ),
                        
                        ),
                      ListTile(
                        title: Text('Deconnexion'),
                        leading: Icon(Icons.logout),
                        onTap: () {
                          Provider.of<Auth>(context, listen: false).logout();
                            
                        },
                      ),
                      // Ajoutez d'autres éléments du menu ici
                    ],
                  );  
            }
             
          })
        ),
    );
  }
}
