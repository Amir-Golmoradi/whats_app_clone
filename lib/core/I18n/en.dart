// ignore_for_file: lines_longer_than_80_chars

import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/I18n/translation.dart';

class EnglishLanguage extends AppTranslationKeys {
  @override
  Map<String, String> get keys => {
        AppMessage.helloAgain: 'HELLO AGAIN',
        AppMessage.email: 'Email',
        AppMessage.password: 'Password',
        AppMessage.confirmPassword: 'Confirm Password',
        AppMessage.forgotPassword: 'Forgot Password?',
        AppMessage.signUp: 'Sign Up',
        AppMessage.login: 'Login',
        AppMessage.logout: 'Log Out',
        AppMessage.notAMember: 'Not a member?',
        AppMessage.registerNow: 'Register now',
        AppMessage.alreadyMember: 'Already a member?',
        AppMessage.loginNow: 'Login now',
        AppMessage.newCommunity: 'New Community',
        AppMessage.community: 'Community',
        AppMessage.whatsApp: 'WhatsApp',
        AppMessage.camera: 'Camera',
        AppMessage.status: 'Status',
        AppMessage.calls: 'Calls',
        AppMessage.contact: 'Contact',
        AppMessage.settings: 'Settings',
        AppMessage.profile: 'Profile',
        AppMessage.chats: 'Chats',
        AppMessage.backupEmail: 'Backup Email',
        AppMessage.resetPassword: 'Reset Password',
        AppMessage.enterYourPw: 'Please enter password!',
        AppMessage.passwordAlert: 'Passwords do not match',
        AppMessage.signupTitle: "Let's create account for you",
        AppMessage.images: 'Images',
        AppMessage.enterMessage: 'Enter Message',
        AppMessage.pleaseWait: 'Please wait',
        AppMessage.newGroup: 'New Group',
        AppMessage.newContact: 'New Contact',
        AppMessage.recentUpdate: 'Recent Update',
        AppMessage.statusTap: 'Tap to add status update',

        AppMessage.fpDescription:
            "Enter the email address with your account and we'll send an email with confirmation to reset your password.",
      };
}
