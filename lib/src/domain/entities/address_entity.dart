class AddressEntity {
  String cep;
  String street;
  String neighborhood;
  String city;
  String state;

  AddressEntity({
    required this.cep,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  factory AddressEntity.empty() {
    return AddressEntity(
      cep: "",
      street: "",
      neighborhood: "",
      city: "",
      state: "",
    );
  }
}
