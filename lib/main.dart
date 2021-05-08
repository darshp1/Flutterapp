import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LOGIN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formkey = GlobalKey<FormState>();
  final _pass = TextEditingController();
  final _confirmpass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _pass.dispose();
    _confirmpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 10.0,
        ),
        child: Form(
          key: _formkey,
            child: Column(
          children: <Widget>[
         Padding(
             padding: const EdgeInsets.all(5.0),
             child:TextFormField(
               validator: (String value){
                 if(value.isEmpty){
                   return 'Username can not be empty';
                 }
                 else if(value.length<3){
                   return 'Username must have at least 3 characters';
                 }
                 return null;
               },
               decoration: InputDecoration(
                   labelText: 'Username',
                   hintText: 'Please Enter Your UserName',
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0)
                   )
               ),
             ),
         ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child:TextFormField(
                validator: (String value){
                  if(value.isEmpty){
                    return 'This field can not be Empty';
                  }
                  else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Please Enter Your Email address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.all(5.0),
                child:TextFormField(
                  obscureText: true,
                  controller: _pass,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Password can not be empty';
                    }
                    else if(value.length<5){
                      return 'Password must have at least 5 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Please enter your Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child:TextFormField(
                  obscureText: true,
                  controller: _confirmpass,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Confirm Password can not be empty';
                    }
                    else if(value.length<5){
                      return 'Confirm Password must have at least 5 characters';
                    }
                    else if(value != _pass.value.text){
                      return 'Password and Confirm-passwrod must be same';

                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Please confirm your Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ),
                )
            ),
          ],
        )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_formkey.currentState.validate()) {
              debugPrint('All validations were correct');
            }
        },
        child: Icon(Icons.done),
      ),
    );
  }

}
