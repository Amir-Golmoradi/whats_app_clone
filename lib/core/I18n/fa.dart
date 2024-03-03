// ignore_for_file: lines_longer_than_80_chars

import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/I18n/translation.dart';

class PersianLanguage extends AppTranslationKeys {
  @override
  Map<String, String> get keys => {
        AppMessage.helloAgain: 'سلام دوباره',
        AppMessage.email: 'ایمیل',
        AppMessage.password: 'رمز عبور',
        AppMessage.confirmPassword: 'تایید رمز عبور',
        AppMessage.forgotPassword: 'رمز عبور خود را فراموش کرده اید؟',
        AppMessage.signUp: 'ثبت نام',
        AppMessage.login: 'ورود',
        AppMessage.logout: 'خروج',
        AppMessage.notAMember: 'حساب کاربری ندارید؟',
        AppMessage.registerNow: 'الان ثبت نام کنید',
        AppMessage.alreadyMember: 'قبلا ثبت نام کرده اید؟',
        AppMessage.loginNow: 'وارد شوید',
        AppMessage.newCommunity: 'انجمن جدید',
        AppMessage.community: 'انجمن',
        AppMessage.whatsApp: 'واتساپ',
        AppMessage.camera: 'دوربین',
        AppMessage.status: 'وضعیت',
        AppMessage.calls: 'تماس ها',
        AppMessage.contact: 'مخاطبین',
        AppMessage.settings: 'تنظیمات',
        AppMessage.profile: 'پروفایل',
        AppMessage.chats: 'گفتگو ها',
        AppMessage.resetPassword: 'بازیابی رمز',
        AppMessage.backupEmail: 'ایمیل پشتیبانی',
        AppMessage.enterYourPw: 'لطفا رمز عبور خود را وارد کنید!',
        AppMessage.passwordAlert: 'رمز های وارد شده یکسان نیستند',
        AppMessage.signupTitle: 'لطفا حساب کاربری خود را ایجاد کنید',
        AppMessage.images: 'عکس ها',
        AppMessage.enterMessage: 'پیغام خود را وارد کنید',
        AppMessage.pleaseWait: 'لطفا صبر کنید',
        AppMessage.newGroup: 'گروه جدید',
        AppMessage.newContact: 'مخاطب جدید',
        AppMessage.recentUpdate: 'آخرین بروزرسانی',
        AppMessage.statusTap: 'برای اضافه کردن وضعیت ضربه بزنید',

        AppMessage.fpDescription:
            'آدرس ایمیل مرتبط با حساب کاربری خود را وارد کنید. ما برای بازنشانی رمز عبور، یک ایمیل تأیید برای شما ارسال خواهیم کرد.',
      };
}
