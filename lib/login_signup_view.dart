library login_signup_view;

enum Flow {
  LOGIN,
  SIGNUP
}

class AuthenticationView {
  Flow flow = Flow.LOGIN;
  AuthenticationView({this.flow});
}