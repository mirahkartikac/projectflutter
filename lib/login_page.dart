import 'package:flutter/material.dart';
import 'package:mywidget/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    myColor = Colors.white;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpeg"),
          fit: BoxFit.cover,
          colorFilter: 
              ColorFilter.mode(myColor.withOpacity(0.01), BlendMode.dstOver)
              )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 30, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.align_vertical_center_rounded,
            size: 150,
            color: Colors.white,
          ),
          Text(
            "GrowWell",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2,
            ),
          ),
          Text(
            "Aplikasi Pemantauan Gizi dan Tumbuh Kembang Anak",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              letterSpacing: 1,
              
            ),
            
          )
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat Datang",
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 32,
            fontWeight: FontWeight.w500
          ),
        ),
        _buildGreyText("Mohon login dengan data Anda"),
        const SizedBox(height: 18,),
        _buildGreyText("Alamat Email"),
        _buildInputField(emailController),
        const SizedBox(height: 15,),
        _buildGreyText("Password"),
        _buildInputField(passwordController),
        _buildRememberForgot(),
        const SizedBox(height: 15,),
        _buildLoginButton(),
        const SizedBox(height: 10,),
        _buildBlackText("Belum memiliki akun? Daftar disini"),
        const SizedBox(height: 10,),
        _buildRegisterButton(),
      ],
    );
  }

  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontWeight: FontWeight.bold
      ),
    );
  }


  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}){
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: isPassword? Icon(Icons.remove_red_eye) : Icon(Icons.done),
        ),
        obscureText: isPassword,
      );
  }

  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, onChanged: (value){
              setState(() {
                rememberUser = value!;
              });
            }),
            _buildGreyText("Ingat saya"),
          ],
        ),
        TextButton(onPressed: (){}, child: _buildUnderlineText("Lupa password?"))
      ],

    );
  }

  Widget _buildLoginButton(){
    return ElevatedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
        );
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        backgroundColor: Colors.indigo,
        shadowColor: Colors.indigo,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      );
  }

  Widget _buildBlackText(String text){
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildRegisterButton(){
    return ElevatedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage())
        );
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        backgroundColor: Colors.white,
        shadowColor: Colors.indigo,
        minimumSize: const Size.fromHeight(45),
      ),
      child: const Text(
          "DAFTAR DI SINI",
          style: TextStyle(
            color: Colors.indigo
          ),
      ),
    );
  }

  Widget _buildUnderlineText(String text){
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }

}

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage>{

  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Register"),
      ),
      body: Stack(
        children: [
          Positioned(top: 20, child: _buildBox(),)
        ],
      ),
    );
  }

  Widget _buildBox(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
            bottomLeft: Radius.circular(45)
          )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Register Formulir",
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10,),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        SizedBox(height: 10,),
        _buildGreyText("Nama"),
        _buildRegisterInput(),
        SizedBox(height: 10,),
        _buildGreyText("Password"),
        _buildInputPassword(),
        SizedBox(height: 10,),
        _buildGreyText("Ulangi Password"),
        _buildInputPassword(),
        _buildPolicynPrivacy(),
        SizedBox(height: 10,),
        _buildRegisButton(),
      ],

    );
  }

  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.normal
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller,
    {isPassword = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRegisterInput(){
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.done)
      ),
    );
  }

  Widget _buildInputPassword(){
    bool obscureText = false;
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(obscureText? Icons.visibility : Icons.visibility_off),
          onPressed: (){
            obscureText = !obscureText;
          },
          )
      ),
    );
  }

  Widget _buildPolicynPrivacy(){
    bool rememberUser = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, onChanged: (value){
              setState(() {
                rememberUser = value!;
              });
            }),
            _buildUnderlineText("Kebijakan dan Privasi"),
          ],
        ),
      ],

    );
  }

  Widget _buildUnderlineText(String text){
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }

  Widget _buildRegisButton(){
    return ElevatedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
        );
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        backgroundColor: Colors.indigo,
        shadowColor: Colors.indigo,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
          "DAFTAR",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      );
  }

}

