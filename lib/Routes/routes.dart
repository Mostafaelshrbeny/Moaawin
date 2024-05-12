import 'package:flutter/material.dart';
import 'package:handyzone/AppNavigation/app_navigation.dart';
import 'package:handyzone/Auth/Login/login_ui.dart';
import 'package:handyzone/Auth/Register/register_ui.dart';
import 'package:handyzone/Auth/Verification/verification.dart';
import 'package:handyzone/Others/Account/account.dart';
import 'package:handyzone/Others/AddAddress/add_address.dart';
import 'package:handyzone/Others/AddReview/add_review.dart';
import 'package:handyzone/Others/AfterPaymentDone/after_payment_done.dart';
import 'package:handyzone/Others/BookingInfo/booking_info.dart';
import 'package:handyzone/Others/BookingSent/booking_sent.dart';
import 'package:handyzone/Others/Bookings/bookings.dart';
import 'package:handyzone/Others/Chat/chat.dart';
import 'package:handyzone/Others/ChatConversation/chat_conversation.dart';
import 'package:handyzone/Others/ConfirmInformation/confirm_information.dart';
import 'package:handyzone/Others/FAQ/faq.dart';
import 'package:handyzone/Others/HomePage/home_page.dart';
import 'package:handyzone/Others/JobCompleted/job_completed.dart';
import 'package:handyzone/Others/Language/language_ui.dart';
import 'package:handyzone/Others/ListOfProviders/list_of_providers.dart';
import 'package:handyzone/Others/ManageAddress/manage_address.dart';
import 'package:handyzone/Others/MyProfile/my_profile.dart';
import 'package:handyzone/Others/PaymentDone/payment_done.dart';
import 'package:handyzone/Others/PrivacyPolicy/privacy_policy.dart';
import 'package:handyzone/Others/ProviderProfile/provider_profile.dart';
import 'package:handyzone/Others/ProviderReview/provider_review.dart';
import 'package:handyzone/Others/SearchPage/search_page.dart';
import 'package:handyzone/Others/ServiceRequest/service_request.dart';
import 'package:handyzone/Others/ServicesPage/services_page.dart';
import 'package:handyzone/Others/StartAJob/start_a_job.dart';
import 'package:handyzone/Others/Support/support.dart';
import 'package:handyzone/Others/Wallet/wallet.dart';

class PageRoutes {
  static const String signIn = 'signIn';
  static const String signUp = 'sign_up';
  static const String verificationPage = "verification";
  static const String homePage = "home_page";
  static const String searchPage = "search_page";
  static const String servicesPage = "services_page";
  static const String appNavigation = "appNavigation";
  static const String serviceRequest = "serviceRequest";
  static const String listOfProviders = "listOfProviders";
  static const String providerProfile = "providerProfile";
  static const String providerReview = "providerReview";
  static const String bookingSent = "bookingSent";
  static const String privacyPolicy = "privacyPolicy";
  static const String languageUi = "languageUi";
  static const String paymentDone = "paymentDone";
  static const String account = "account";
  static const String myProfile = "myProfile";
  static const String faq = "faq";
  static const String addReview = "addReview";
  static const String support = "support";
  static const String manageAddress = "manageAddress";
  static const String addAddress = "addAddress";
  static const String wallet = "wallet";
  static const String chatConversation = "chatConversation";
  static const String chat = "chat";
  static const String confirmInformation = "confirmInformation";
  static const String bookings = "bookings";
  static const String bookingInfo = "bookingInfo";
  static const String startAJob = "startAJob";
  static const String jobCompleted = "jobCompleted";
  static const String afterPaymentDone = "afterPaymentDone";

  Map<String, WidgetBuilder> routes() {
    return {
      signUp: (context) => RegisterUI(),
      verificationPage: (context) => VerificationUI(),
      homePage: (context) => HomePageUI(),
      searchPage: (context) => SearchPageUI(),
      servicesPage: (context) => ServicesPageUI(),
      appNavigation: (context) => AppNavigation(),
      serviceRequest: (context) => ServiceRequestUI(),
      listOfProviders: (context) => ListOfProviders(),
      providerProfile: (context) => ProviderProfile(),
      providerReview: (context) => ProviderReview(),
      bookingSent: (context) => BookingSent(),
      privacyPolicy: (context) => PrivacyPolicy(),
      languageUi: (context) => LanguageUI(),
      paymentDone: (context) => PaymentDone(),
      account: (context) => Account(),
      myProfile: (context) => MyProfile(),
      faq: (context) => FAQ(),
      addReview: (context) => AddReview(),
      support: (context) => Support(),
      manageAddress: (context) => ManageAddress(),
      addAddress: (context) => AddAddress(),
      wallet: (context) => Wallet(),
      chatConversation: (context) => ChatConversation(),
      chat: (context) => Chat(),
      confirmInformation: (context) => ConfirmInformation(),
      bookings: (context) => Bookings(),
      bookingInfo: (context) => BookingInfo(),
      startAJob: (context) => StartAJob(),
      jobCompleted: (context) => JobCompleted(),
      afterPaymentDone: (context) => AfterPaymentDone(),
      signIn: (context) => SignInUI(),
    };
  }
}
