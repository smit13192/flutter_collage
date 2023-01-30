class Cart {
  String id;
  String pid;

  Cart({required this.id, required this.pid});
  factory Cart.fromMap(String id, Map map) => Cart(id: id, pid: map['pid']);
  Map<String, String> toMap() => {'id': id, 'pid': pid};
}
