// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);


// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first, avoid_dynamic_calls

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str )as Map<String, dynamic>);

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
    AddAddressModel({
        required this.nSiXed7CbVvNdVbbnky,
    });

    NSiXed7CbVvNdVbbnky nSiXed7CbVvNdVbbnky;

    factory AddAddressModel.fromJson(dynamic json) => AddAddressModel(
        nSiXed7CbVvNdVbbnky: NSiXed7CbVvNdVbbnky.fromJson(json['-NSiXED7cbVvNDVbbnky'] as dynamic),
    );

    Map<String, dynamic> toJson() => {
        '-NSiXED7cbVvNDVbbnky': nSiXed7CbVvNdVbbnky.toJson(),
    };
}

class NSiXed7CbVvNdVbbnky {
    NSiXed7CbVvNdVbbnky({
        required this.addressBook,
    });

    List<AddressBook> addressBook;

    factory NSiXed7CbVvNdVbbnky.fromJson(dynamic json) => NSiXed7CbVvNdVbbnky(
        addressBook: List<AddressBook>.from((json['address_book']as List).map((x) => AddressBook.fromJson(x as dynamic))),
    );

    Map<String, dynamic> toJson() => {
        'address_book': List<dynamic>.from(addressBook.map((x) => x.toJson())),
    };
}

class AddressBook {
    AddressBook({
        required this.id,
        required this.location,
        required this.locationType,
        required this.phone,
    });

    int id;
    String location;
    String locationType;
    int phone;

    factory AddressBook.fromJson(dynamic json) => AddressBook(
        id: json['id']as int,
        location: json['location']as String,
        locationType: json['location_type']as String,
        phone: json['phone']as int,
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'location': location,
        'location_type': locationType,
        'phone': phone,
    };
}
