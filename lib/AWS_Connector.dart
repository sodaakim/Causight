//
// import 'amplifyconfiguration.dart';
// import 'package:flutter/cupertino.dart';
//
// class XXXXX extends StatefulWidget {
//   @override
//   _XXXXXState createState() => _XXXXXState();_XXXXXState
// }
//
// class _XXXXXState extends State<XXXXX> {
//
//
//   @override
//   void initState() {
//     super.initState();
//     _configureAmplify();
//   }
//
//   void _configureAmplify() async {
//     final auth = AmplifyAuthCognito(); // 2. Auth 서비스 생성
//     final analytics = AmplifyAnalyticsPinpoint(); // 3. Analytics 서비스 생성
//
//     try {
//       Amplify.addPlugins([auth, analytics]);  // 4. 플러그인 추가
//       await Amplify.configure(amplifyconfig);
//       configured = true;
//     } catch (e) {
//       print(e);
//     }
//
//     if (configured) {
//       print('Successfully configured Amplify 🎉');
//     }
//   }