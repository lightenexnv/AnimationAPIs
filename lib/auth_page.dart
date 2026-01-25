import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isPasswordVisible = false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'auth-button',
        child: Material(
          color: Colors.blue,
          child: SafeArea(
            child: DefaultTabController(
              length: 2,child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      alignment: Alignment.centerLeft,
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
              
                    const SizedBox(height: 40),
              
                    Container(
                      height: 48,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(text: "Login"),
                          Tab(text: "Signup"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _Logintab(),
                          _Signuptab()
                        ],
                      ),
                    ),
              
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _Logintab(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const SizedBox(height: 40),

          const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          _inputField("Email"),
          const SizedBox(height: 16),
          _inputField("Password", isPasswordVisible: true),

          const SizedBox(height: 30),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text("Login"),
          ),

          const SizedBox(height: 20),

          Builder(builder: (context) => TextButton(
            onPressed: () {DefaultTabController.of(context).animateTo(1);
            },
            child: const Text(
              "Create an account",
              style: TextStyle(color: Colors.white),
            ),
          ),)
        ],
      ),
    );
  }

  Widget _Signuptab(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),

          const Text(
            "SignUp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          _inputField("Email"),
          const SizedBox(height: 16),
          _inputField("Password", isPasswordVisible: true),

          const SizedBox(height: 30),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text("Login"),
          ),

          const SizedBox(height: 20),

         Builder(builder: (context) =>  TextButton(
           onPressed: () {
             DefaultTabController.of(context).animateTo(0);
           },
           child: const Text(
             "Already have an account? Login",
             style: TextStyle(color: Colors.white),
           ),
         ),)
        ],
      ),
    );
  }

  Widget _inputField(String hint, {bool isPasswordVisible = false,}) {
    return TextField(
      obscureText: !_isPasswordVisible,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
        suffixIcon: isPasswordVisible?IconButton(onPressed: (){
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        }, icon: Icon(_isPasswordVisible?Icons.visibility_off:Icons.visibility,color: Colors.white,)):null
      ),
      );
  }
}
