import 'package:flutter/material.dart';
import 'package:okpa_front/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

      final _formKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
   
  @override

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Form(
              key: _formKey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                        TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (val) => val!.isEmpty ? 'Email invalide' : null,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10,),
                      TextFormField(
                      
                        controller: _passwordController,
                        obscureText: true,
                        validator: (val) => val!.length<6 ? 'Mot de passe invalide' : null,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10,),
                     // ignore: sort_child_properties_last, prefer_const_constructors
                     TextButton(child: Text("Connexion",style: TextStyle(color: Colors.white),),
                      // ignore: prefer_const_constructors
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                        padding:   MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10)),
                          ),
                      onPressed: ()  {
                        Map creds = {
                          'email': _emailController.text,
                          'password': _passwordController.text,
                        };
                        if (_formKey.currentState!.validate()) {
                            Provider.of<Auth>(context, listen: false).login(creds:creds);
                            Navigator.pop(context);
                        }
                      },   
               ),
                ],
              ),
          ),
        ),
        
    );
  }


}
