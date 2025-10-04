import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light()),
      ),
      title: 'Lake City Creamery & Coffee',
      home: HomePage(),
    );
  }
}


//PART OF THE SIGNIN AUTHENTICATION THAT HAS BEEN REMOVED DOWN TO THE NEXT COMMENT ABOUT THE AUTHENTICATION
// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }
//   Future<void> init() async {
//     await Firebase.initializeApp();
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//       } else {
//         _loginState = ApplicationLoginState.loggedOut;
//       }
//       notifyListeners();
//     });
//   }
//
//   ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
//   ApplicationLoginState get loginState => _loginState;
//
//   String? _email;
//   String? get email => _email;
//
//   void startLoginFlow() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }
//
//   void verifyEmail(
//     String email,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       var methods =
//           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       if (methods.contains('password')) {
//         _loginState = ApplicationLoginState.password;
//       } else {
//         _loginState = ApplicationLoginState.register;
//       }
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signInWithEmailAndPassword(
//     String email,
//     String password,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void cancelRegistration() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }
//
//   void registerAccount(String email, String displayName, String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user!.updateDisplayName(displayName);
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }
//PART OF THE AUTHENTICATION SIGNIN FUNCTIONALITY THAT HAS BEEN REMOVED FROM THIS APP
