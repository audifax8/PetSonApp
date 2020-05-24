class Pagination {
  final int _limit = 10;
  int _page;
  int _totalItemsCount;

  Pagination() {
    _page = 1;
    _totalItemsCount = 0;
  }

  int get getTotalItemCount => _totalItemsCount;

  void setTotalItemCount(int totalItems) {
    _totalItemsCount = totalItems;
  }

  void incrementPage () {
    _page++;
  }

  bool shouldSearch() {
    int _shouldSearch = _limit * (_page + 1);
    return _shouldSearch <=  _totalItemsCount;
  }

  String getPaginationQueryParams () {
    return '&page=$_page&limit=$_limit&';
  }

}