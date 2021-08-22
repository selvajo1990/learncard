class DashboardModel {
  int totalCount;
  String tableName;

  DashboardModel({this.totalCount = 0, this.tableName = ""});

  factory DashboardModel.dashboardCardDetails(
      {int totalCount = 0, String tableName = ""}) {
    return DashboardModel(totalCount: totalCount, tableName: tableName);
  }
}
