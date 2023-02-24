class FavouriteProduct {
  // pid is the unique id and the fid is the product id
  String pid;
  String fid;

  FavouriteProduct({required this.pid, required this.fid});

  factory FavouriteProduct.fromJson(String pid, Map map) {
    return FavouriteProduct(pid: pid, fid: map["fid"]);
  }
  Map<String, String> toMap() => {"pid": pid, "fid": fid};
}
