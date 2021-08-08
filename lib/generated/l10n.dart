// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Invalid user name or password `
  String get invalidLogin {
    return Intl.message(
      'Invalid user name or password ',
      name: 'invalidLogin',
      desc: '',
      args: [],
    );
  }

  /// `ueser not verified`
  String get userNotVerified {
    return Intl.message(
      'User not verified',
      name: 'userNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset`
  String get resetPassword {
    return Intl.message(
      'Password Reset',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send link`
  String get sendResetPasswordLink {
    return Intl.message(
      'Send link',
      name: 'sendResetPasswordLink',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get DoNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'DoNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `My services`
  String get myServices {
    return Intl.message(
      'My services',
      name: 'myServices',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `you have added`
  String get youHaveAdded {
    return Intl.message(
      'you have added',
      name: 'youHaveAdded',
      desc: '',
      args: [],
    );
  }

  /// `service to cart`
  String get cartService {
    return Intl.message(
      'service to cart',
      name: 'cartService',
      desc: '',
      args: [],
    );
  }

  /// `You Email`
  String get email {
    return Intl.message(
      'You Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `invalid password`
  String get invalidPassword {
    return Intl.message(
      'invalid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `invalid Email`
  String get invalidEmail {
    return Intl.message(
      'invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `invalid`
  String get invalid {
    return Intl.message(
      'invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `password not matched`
  String get notMatchedPassword {
    return Intl.message(
      'password not matched',
      name: 'notMatchedPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone number`
  String get invalidEmptyPhoneNumber {
    return Intl.message(
      'Invalid Phone number',
      name: 'invalidEmptyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account you are agree to our \n terms of services and privacy Policy`
  String get policyHint {
    return Intl.message(
      'By creating an account you are agree to our \n terms of services and privacy Policy',
      name: 'policyHint',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get accountCreated {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreated',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox`
  String get checkYourInbox {
    return Intl.message(
      'Check your inbox',
      name: 'checkYourInbox',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you a link through\nThe email you just entered`
  String get checkYourInboxDesc {
    return Intl.message(
      'We have sent you a link through\nThe email you just entered',
      name: 'checkYourInboxDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `EGPِ`
  String get egp {
    return Intl.message(
      'EGPِ',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `you have removed`
  String get youHaveRemoved {
    return Intl.message(
      'you have removed',
      name: 'youHaveRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get createNewAccount {
    return Intl.message(
      'Create new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid user name`
  String get invalidUserName {
    return Intl.message(
      'Invalid user name',
      name: 'invalidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid first name`
  String get invalidFirstName {
    return Intl.message(
      'Invalid first name',
      name: 'invalidFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid last name`
  String get invalidLastName {
    return Intl.message(
      'Invalid last name',
      name: 'invalidLastName',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than 6 char`
  String get passwordErrorLength {
    return Intl.message(
      'Password must be more than 6 char',
      name: 'passwordErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Password not matched`
  String get passwordWordNotMatched {
    return Intl.message(
      'Password not matched',
      name: 'passwordWordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Please check internet connection and try again.`
  String get onTryAgainMessage {
    return Intl.message(
      'Please check internet connection and try again.',
      name: 'onTryAgainMessage',
      desc: '',
      args: [],
    );
  }

  /// `No connection`
  String get noConnection {
    return Intl.message(
      'No connection',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find any results matching your applied Type.`
  String get emptyListMessage {
    return Intl.message(
      'We couldn\'t find any results matching your applied Type.',
      name: 'emptyListMessage',
      desc: '',
      args: [],
    );
  }

  /// `No result Found`
  String get noResultFound {
    return Intl.message(
      'No result Found',
      name: 'noResultFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get someThingWrong {
    return Intl.message(
      'Something went wrong',
      name: 'someThingWrong',
      desc: '',
      args: [],
    );
  }

  /// `'The application has encountered an unknown error.\n'\n 'Please try again later.'`
  String get applicationError {
    return Intl.message(
      '\'The application has encountered an unknown error.\n\'\n \'Please try again later.\'',
      name: 'applicationError',
      desc: '',
      args: [],
    );
  }

  /// `Password mustn't contain any spaces`
  String get passwordSpaceError {
    return Intl.message(
      'Password mustn\'t contain any spaces',
      name: 'passwordSpaceError',
      desc: '',
      args: [],
    );
  }

  /// `EGPِ`
  String get egpPrice {
    return Intl.message(
      'EGPِ',
      name: 'egpPrice',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addNewAddress {
    return Intl.message(
      'Add new address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address name`
  String get addressName {
    return Intl.message(
      'Address name',
      name: 'addressName',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get addressCity {
    return Intl.message(
      'City',
      name: 'addressCity',
      desc: '',
      args: [],
    );
  }

  /// `Address street`
  String get addressStreet {
    return Intl.message(
      'Address street',
      name: 'addressStreet',
      desc: '',
      args: [],
    );
  }

  /// `Building number`
  String get addressBuildingNumber {
    return Intl.message(
      'Building number',
      name: 'addressBuildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Floor number`
  String get AddressFloorNumber {
    return Intl.message(
      'Floor number',
      name: 'AddressFloorNumber',
      desc: '',
      args: [],
    );
  }

  /// `Apartment number`
  String get apartmentNumber {
    return Intl.message(
      'Apartment number',
      name: 'apartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Saved places`
  String get savedPlaces {
    return Intl.message(
      'Saved places',
      name: 'savedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Choose date`
  String get chooseDate {
    return Intl.message(
      'Choose date',
      name: 'chooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Pay on Delivery`
  String get payOnDelivery {
    return Intl.message(
      'Pay on Delivery',
      name: 'payOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `No saved places`
  String get noSavedPlaces {
    return Intl.message(
      'No saved places',
      name: 'noSavedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Create request`
  String get createRequest {
    return Intl.message(
      'Create request',
      name: 'createRequest',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Choose visiting date`
  String get chooseCheckDate {
    return Intl.message(
      'Choose visiting date',
      name: 'chooseCheckDate',
      desc: '',
      args: [],
    );
  }

  /// `Address submitted Successfully`
  String get addressCreatedSuccessfully {
    return Intl.message(
      'Address submitted Successfully',
      name: 'addressCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Address updated Successfully`
  String get addressUpdatedSuccessfully {
    return Intl.message(
      'Address updated Successfully',
      name: 'addressUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please add address in order to submit request`
  String get pleaseAddAddress {
    return Intl.message(
      'Please add address in order to submit request',
      name: 'pleaseAddAddress',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `you order has been sent !`
  String get transactionSubmitted {
    return Intl.message(
      'you order has been sent !',
      name: 'transactionSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a call from our representatives to confirm your appointment  You can track your order from`
  String get transactionSubmittedDesc {
    return Intl.message(
      'You will receive a call from our representatives to confirm your appointment  You can track your order from',
      name: 'transactionSubmittedDesc',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message(
      'Confirmed',
      name: 'confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `OnGoing`
  String get onGoing {
    return Intl.message(
      'OnGoing',
      name: 'onGoing',
      desc: '',
      args: [],
    );
  }

  /// `delivered`
  String get delivered {
    return Intl.message(
      'delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `My addresses`
  String get myAddresses {
    return Intl.message(
      'My addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Personal info`
  String get personalInfo {
    return Intl.message(
      'Personal info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `password not matched`
  String get passwordNotMatched {
    return Intl.message(
      'password not matched',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Change name`
  String get changeName {
    return Intl.message(
      'Change name',
      name: 'changeName',
      desc: '',
      args: [],
    );
  }

  /// `Choose new profile Photo`
  String get chooseNewProfilePhoto {
    return Intl.message(
      'Choose new profile Photo',
      name: 'chooseNewProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get choosePhoto {
    return Intl.message(
      'Choose from Gallery',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Capture photo`
  String get CapturePhoto {
    return Intl.message(
      'Capture photo',
      name: 'CapturePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Delete photo`
  String get deletePhoto {
    return Intl.message(
      'Delete photo',
      name: 'deletePhoto',
      desc: '',
      args: [],
    );
  }

  /// `done`
  String get updated {
    return Intl.message(
      'done',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `Add new phone`
  String get addNewPhone {
    return Intl.message(
      'Add new phone',
      name: 'addNewPhone',
      desc: '',
      args: [],
    );
  }

  /// `Edit phoneِ`
  String get editPhone {
    return Intl.message(
      'Edit phoneِ',
      name: 'editPhone',
      desc: '',
      args: [],
    );
  }

  /// `Add new Service`
  String get addNewService {
    return Intl.message(
      'Add new Service',
      name: 'addNewService',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `You can cancel the application file within two hours`
  String get cancelOrderNote {
    return Intl.message(
      'You can cancel the application file within two hours',
      name: 'cancelOrderNote',
      desc: '',
      args: [],
    );
  }

  /// `services`
  String get services {
    return Intl.message(
      'services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `5th settlements`
  String get fixedAddressOne {
    return Intl.message(
      '5th settlements',
      name: 'fixedAddressOne',
      desc: '',
      args: [],
    );
  }

  /// `Delivering to`
  String get deliveringTo {
    return Intl.message(
      'Delivering to',
      name: 'deliveringTo',
      desc: '',
      args: [],
    );
  }

  /// `Request the services you want to reach your home in the fastest time`
  String get homeTitleDesc {
    return Intl.message(
      'Request the services you want to reach your home in the fastest time',
      name: 'homeTitleDesc',
      desc: '',
      args: [],
    );
  }

  /// `Please complete registration form`
  String get pleaseCompeteRegistrationForm {
    return Intl.message(
      'Please complete registration form',
      name: 'pleaseCompeteRegistrationForm',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `select country`
  String get selectCountry {
    return Intl.message(
      'select country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get egypt {
    return Intl.message(
      'Egypt',
      name: 'egypt',
      desc: '',
      args: [],
    );
  }

  /// `UAE`
  String get uae {
    return Intl.message(
      'UAE',
      name: 'uae',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Petzola`
  String get welcomeToPetzola {
    return Intl.message(
      'Welcome to Petzola',
      name: 'welcomeToPetzola',
      desc: '',
      args: [],
    );
  }

  /// ` Your Name`
  String get yourName {
    return Intl.message(
      ' Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndCondition {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `I Agree`
  String get iAgree {
    return Intl.message(
      'I Agree',
      name: 'iAgree',
      desc: '',
      args: [],
    );
  }

  /// `Pet's Name`
  String get petName {
    return Intl.message(
      'Pet\'s Name',
      name: 'petName',
      desc: '',
      args: [],
    );
  }

  /// `Select Pet's type`
  String get selectYourPet {
    return Intl.message(
      'Select Pet\'s type',
      name: 'selectYourPet',
      desc: '',
      args: [],
    );
  }

  /// `Select a type`
  String get selectAType {
    return Intl.message(
      'Select a type',
      name: 'selectAType',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Time to add your best friend (your pet)!`
  String get timeToAddPet {
    return Intl.message(
      'Time to add your best friend (your pet)!',
      name: 'timeToAddPet',
      desc: '',
      args: [],
    );
  }

  /// `You’re One Step Ahead of joining Petzola Community`
  String get lastStepText {
    return Intl.message(
      'You’re One Step Ahead of joining Petzola Community',
      name: 'lastStepText',
      desc: '',
      args: [],
    );
  }

  /// `Select breed`
  String get selectBreed {
    return Intl.message(
      'Select breed',
      name: 'selectBreed',
      desc: '',
      args: [],
    );
  }

  /// `profile is ready!`
  String get profileReady {
    return Intl.message(
      'profile is ready!',
      name: 'profileReady',
      desc: '',
      args: [],
    );
  }

  /// `Add their profile pic now (or later)`
  String get AddProfilePic {
    return Intl.message(
      'Add their profile pic now (or later)',
      name: 'AddProfilePic',
      desc: '',
      args: [],
    );
  }

  /// `Be sure to set a strong\npassword`
  String get newPasswordNoteText {
    return Intl.message(
      'Be sure to set a strong\npassword',
      name: 'newPasswordNoteText',
      desc: '',
      args: [],
    );
  }

  /// `Do not worry you will restart\nYour account quickly`
  String get newPasswordNoteText_2 {
    return Intl.message(
      'Do not worry you will restore\nYour account quickly',
      name: 'newPasswordNoteText_2',
      desc: '',
      args: [],
    );
  }

  /// `Save new password`
  String get saveNewPassword {
    return Intl.message(
      'Save new password',
      name: 'saveNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `weight`
  String get weight {
    return Intl.message(
      'weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message(
      'Resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend the code to the number?`
  String get resendText {
    return Intl.message(
      'Resend the code to the number?',
      name: 'resendText',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verifyEmail {
    return Intl.message(
      'Verify Email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Code sent to `
  String get codeSentTo {
    return Intl.message(
      'Code sent to ',
      name: 'codeSentTo',
      desc: '',
      args: [],
    );
  }

  /// `Pet name is Required`
  String get petNameIsRequired {
    return Intl.message(
      'Pet name is Required',
      name: 'petNameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Pet type is Required`
  String get petTypeIsRequired {
    return Intl.message(
      'Pet type is Required',
      name: 'petTypeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please select birth date`
  String get pleaseSelectBirthDate {
    return Intl.message(
      'Please select birth date',
      name: 'pleaseSelectBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Please select Pet weight`
  String get pleaseSelectWeight {
    return Intl.message(
      'Please select Pet weight',
      name: 'pleaseSelectWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please select pet breed`
  String get pleaseSelectBreed {
    return Intl.message(
      'Please select pet breed',
      name: 'pleaseSelectBreed',
      desc: '',
      args: [],
    );
  }

  /// `done`
  String get done {
    return Intl.message(
      'done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `My pets`
  String get myPet {
    return Intl.message(
      'My pets',
      name: 'myPet',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `reservation`
  String get reservation {
    return Intl.message(
      'reservation',
      name: 'reservation',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friend`
  String get InviteFriend {
    return Intl.message(
      'Invite Friend',
      name: 'InviteFriend',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'terms&conditions' key

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `My Clinics`
  String get myClinics {
    return Intl.message(
      'My Clinics',
      name: 'myClinics',
      desc: '',
      args: [],
    );
  }

  /// `Add one`
  String get addOne {
    return Intl.message(
      'Add one',
      name: 'addOne',
      desc: '',
      args: [],
    );
  }

  /// `clinics`
  String get clinics {
    return Intl.message(
      'clinics',
      name: 'clinics',
      desc: '',
      args: [],
    );
  }

  /// `veterinarians`
  String get veterinarians {
    return Intl.message(
      'veterinarians',
      name: 'veterinarians',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming schedule`
  String get UpcomingSchedule {
    return Intl.message(
      'Upcoming schedule',
      name: 'UpcomingSchedule',
      desc: '',
      args: [],
    );
  }

  /// `PickUp Your Service`
  String get pickUpYourService {
    return Intl.message(
      'PickUp Your Service',
      name: 'pickUpYourService',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}