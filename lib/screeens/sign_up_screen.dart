import 'package:whetstone/constants/constants.dart';
import 'package:whetstone/screeens/sign_in_screen.dart';
import 'package:whetstone/widgets/top_logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  static final id = '/sign_up';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [TopLogo(), SignInForm()],
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  //TEXT EDITING CONTROLLERS
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void submitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      //TODO: Enter Backend code to submit form

    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _nameTextField(context),
          // _forgetUserNameBtn(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _passwordTextField(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _confirmPasswordTextField(context),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          _signUpBtn(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SignUpWarning(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SignInWarning(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          LoginWithFbGmail()
        ],
      ),
    );
  }

  Widget _nameTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        controller: _userNameController,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value.isEmpty) {
            return "Please Enter a valid name";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Name",
          filled: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, width: 2, style: BorderStyle.solid),
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: kRegPrefixIconColor,
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        controller: _passwordController,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return "Please Enter a valid password";
          }
          return null;
        },
        onFieldSubmitted: (_) {
          // FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        decoration: InputDecoration(
          labelText: "Password",
          filled: false,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.lock,
            color: kRegPrefixIconColor,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          focusColor: Colors.green,
        ),
      ),
    );
  }

  Widget _confirmPasswordTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        controller: _confirmPasswordController,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return "Please Enter a password";
          }
          return null;
        },
        onFieldSubmitted: (_) {
          // FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        decoration: InputDecoration(
          labelText: "Confirm Password",
          filled: false,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.lock,
            color: kRegPrefixIconColor,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          focusColor: Colors.green,
        ),
      ),
    );
  }

  GestureDetector _signUpBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignInScreen.id);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Center(
            child: Text(
          'SIGN UP',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class LoginWithFbGmail extends StatelessWidget {
  const LoginWithFbGmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xff0035bb),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 70,
            height: 70,
            child: Image(
              image: AssetImage('assets/images/gmail-logo-preview.png'),
            ),
          ),
        )
      ],
    );
  }
}

class SignUpWarning extends StatelessWidget {
  const SignUpWarning({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    );
  }
}
