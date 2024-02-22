class ApiApps {
  // NOTE: API LOCAL
  // static const baseUrl = "http://localhost/apis/dilrecordmoney-api";
  static const baseUrl = "http://190.110.1.182/apis/dilrecordmoney-api";

  // NOTE: API USER AUTH
  static const user = "$baseUrl/user";
  static const login = "$user/login.php";
  static const register = "$user/register.php";

  // NOTE: API HISTORY
  static const history = "$baseUrl/history";
  static const addIncomeOutcome = "$history/add.php";
  static const update = "$history/update.php";
  static const analysis = "$history/analysis.php";

  static const inOutcome = "$history/income_outcome.php";
  static const search = "$history/income_outcome_search.php";
  static const whereDate = "$history/where_date.php";

  static const riwayat = "$history/history.php";
  static const riwayatSearch = "$history/history_search.php";

  static const delete = "$history/delete.php";
}
