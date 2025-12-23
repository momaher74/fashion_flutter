class AddressModel {
  final String? id;
  final String name;
  final String phone;
  final String city;
  final String governorate;
  final String street;
  final String? notes;
  final String? createdAt;
  final String? updatedAt;

  AddressModel({
    this.id,
    required this.name,
    required this.phone,
    required this.city,
    required this.governorate,
    required this.street,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  // From JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['_id'],
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      city: json['city'] ?? '',
      governorate: json['governorate'] ?? '',
      street: json['street'] ?? '',
      notes: json['notes'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'city': city,
      'governorate': governorate,
      'street': street,
      if (notes != null && notes!.isNotEmpty) 'notes': notes,
    };
  }

  // Copy with
  AddressModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? city,
    String? governorate,
    String? street,
    String? notes,
    String? createdAt,
    String? updatedAt,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      governorate: governorate ?? this.governorate,
      street: street ?? this.street,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
