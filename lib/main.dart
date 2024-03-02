import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/service/firebase_options.dart';
import 'package:whats_app_clone/core/theme/theme.dart';
import 'package:whats_app_clone/core/utils/tab_screen.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase_auth.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/blocs/login-cubit/login_cubit.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/blocs/signup-cubit/sign_up_cubit.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/auth_gate.dart';
import 'package:whats_app_clone/src/camera_feature/camera_screen.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/blocs/cubit/chat_cubit.dart';
import 'package:whats_app_clone/src/home_features/0_data/repository/user_interface.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/blocs/users-bloc/users_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameraDescription = await availableCameras();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, deviceType) =>
          MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit(FirebaseAuthService())),
          BlocProvider(create: (context) => SignUpCubit(FirebaseAuthService())),
          BlocProvider(create: (context) => ChatCubit(ChatService())),
          BlocProvider(create: (context) => UsersBloc(UserRepoImpl())),
        ],
        child: MaterialApp(
          routes: appRoute,
          theme: lightMode,
          initialRoute: '/',
          darkTheme: darkMode,
          title: 'Flutter Demo',
          home: const AuthGate(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
