import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_examples/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl= TextEditingController();
  TextEditingController passwordControl= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authPrrovider= Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailControl,
              decoration: InputDecoration(
                hintText: 'Email',

              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordControl,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                authPrrovider.login(emailControl.text.toString(), passwordControl.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authPrrovider.loading ? CircularProgressIndicator( color: Colors.white,) : Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
