class ApiApps {
  // NOTE: API LOCAL
  static const baseUrl = "http://localhost/apis/dilrecordmoney-api";

  // NOTE: API HISTORY
  static const history = "$baseUrl/history";
  static const addIncomeOutcome = "$history/add.php";
  static const analysis = "$history/analysis.php";

  // NOTE: API USER AUTH
  static const user = "$baseUrl/user";
  static const login = "$user/login.php";
  static const register = "$user/register.php";
}
