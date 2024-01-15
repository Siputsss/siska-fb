import 'dart:convert';

class ProdukX {
  final String id;
  final String nama;
  final String desc;
  final String createdAt;
  final String image;
  final int harga;
  ProdukX({
    this.id = '',
    this.nama = '',
    this.desc = '',
    this.createdAt = '',
    this.image = '',
    this.harga = 0,
  });

  ProdukX copyWith({
    String? id,
    String? nama,
    String? desc,
    String? createdAt,
    String? image,
    int? harga,
  }) {
    return ProdukX(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      desc: desc ?? this.desc,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      harga: harga ?? this.harga,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nama': nama});
    result.addAll({'desc': desc});
    result.addAll({'created_at': createdAt});
    result.addAll({'image': image});
    result.addAll({'harga': harga});

    return result;
  }

  factory ProdukX.fromMap(Map<String, dynamic> map) {
    return ProdukX(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      desc: map['desc'] ?? '',
      createdAt: map['created_at'] ?? '',
      image: map['image'] ?? '',
      harga: map['harga']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukX.fromJson(String source) => ProdukX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProdukX(id: $id, nama: $nama, desc: $desc, createdAt: $createdAt, image: $image, harga: $harga)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProdukX &&
        other.id == id &&
        other.nama == nama &&
        other.desc == desc &&
        other.createdAt == createdAt &&
        other.image == image &&
        other.harga == harga;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nama.hashCode ^ desc.hashCode ^ createdAt.hashCode ^ image.hashCode ^ harga.hashCode;
  }
}
