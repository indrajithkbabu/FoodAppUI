// ignore_for_file: inference_failure_on_instance_creation, use_build_context_synchronously, unawaited_futures, lines_longer_than_80_chars

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';

import 'package:sizer/sizer.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'An email has been sent to ${user.email} ,please verify',
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A2C42),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenHome(),
        ),
      );
    }
  }
}
