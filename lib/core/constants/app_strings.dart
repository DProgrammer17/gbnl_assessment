abstract class AppStrings {
  static const appName = "Blott";
  static const fontFamily = "Geometria";
  static const yourLegalName = "Your legal name";
  static const weNeedToAboutYou =
      "We need to know a bit about you so that we can create your account.";
  static const firstName = "First name";
  static const lastName = "Last name";
  static const firstNameKey = "firstname";
  static const continueText = "Continue";
  static const newsGotten = "News Updated. Enjoy the news!";
  static const getTheMostOutBlott = "Get the most out of Blott ✅";
  static const allowNotificationStayInLoop = "Allow notifications to stay in the loop with your payments, requests and groups.";
  static String heyFirstName(String firstName) => "Hey $firstName";
}

abstract class ErrorStrings{
  static const somethingWentWrong = 'Something went wrong. Please try again later.';
  static const firstNameEmpty = 'First name can not be empty.';
  static const lastNameEmpty = 'Last name can not be empty.';
}
