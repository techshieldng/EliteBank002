// ignore_for_file: file_names

import 'dart:convert';

import '../../../../../widgets/payment_link/custom_drop_down.dart';

VirtualCardSudoInfoModel virtualCardSudoInfoModelFromJson(String str) =>
    VirtualCardSudoInfoModel.fromJson(json.decode(str));

String virtualCardSudoInfoModelToJson(VirtualCardSudoInfoModel data) =>
    json.encode(data.toJson());

class VirtualCardSudoInfoModel {
  Message message;
  Data data;

  VirtualCardSudoInfoModel({
    required this.message,
    required this.data,
  });

  factory VirtualCardSudoInfoModel.fromJson(Map<String, dynamic> json) =>
      VirtualCardSudoInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String baseCurr;
  dynamic baseCurrRate;
  List<SupportedCurrency> supportedCurrency;
  bool cardCreateAction;
  CardBasicInfo cardBasicInfo;
  List<MyCard> myCard;
  CardCharge cardCharge;
  List<Transaction> transactions;

  Data({
    required this.baseCurr,
    required this.baseCurrRate,
    required this.supportedCurrency,
    required this.cardCreateAction,
    required this.cardBasicInfo,
    required this.myCard,
    required this.cardCharge,
    required this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseCurr: json["base_curr"],
        baseCurrRate: json["base_curr_rate"],
        supportedCurrency: List<SupportedCurrency>.from(
            json["supported_currency"]
                .map((x) => SupportedCurrency.fromJson(x))),
        cardCreateAction: json["card_create_action"],
        cardBasicInfo: CardBasicInfo.fromJson(json["card_basic_info"]),
        myCard:
            List<MyCard>.from(json["myCard"].map((x) => MyCard.fromJson(x))),
        cardCharge: CardCharge.fromJson(json["cardCharge"]),
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "base_curr_rate": baseCurrRate,
        "supported_currency":
            List<dynamic>.from(supportedCurrency.map((x) => x.toJson())),
        "card_create_action": cardCreateAction,
        "card_basic_info": cardBasicInfo.toJson(),
        "myCard": List<dynamic>.from(myCard.map((x) => x.toJson())),
        "cardCharge": cardCharge.toJson(),
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class CardBasicInfo {
  String cardBackDetails;
  String cardBg;
  String siteTitle;
  String siteLogo;

  CardBasicInfo({
    required this.cardBackDetails,
    required this.cardBg,
    required this.siteTitle,
    required this.siteLogo,
  });

  factory CardBasicInfo.fromJson(Map<String, dynamic> json) => CardBasicInfo(
        cardBackDetails: json["card_back_details"],
        cardBg: json["card_bg"],
        siteTitle: json["site_title"],
        siteLogo: json["site_logo"],
      );

  Map<String, dynamic> toJson() => {
        "card_back_details": cardBackDetails,
        "card_bg": cardBg,
        "site_title": siteTitle,
        "site_logo": siteLogo,
      };
}

class CardCharge {
  int id;
  String slug;
  String title;
  double fixedCharge;
  double percentCharge;
  double minLimit;
  double maxLimit;

  CardCharge({
    required this.id,
    required this.slug,
    required this.title,
    required this.fixedCharge,
    required this.percentCharge,
    required this.minLimit,
    required this.maxLimit,
  });

  factory CardCharge.fromJson(Map<String, dynamic> json) => CardCharge(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        fixedCharge: double.parse(json["fixed_charge"] ?? "0.0"),
        percentCharge: double.parse(json["percent_charge"] ?? "0.0"),
        minLimit: double.parse(json["min_limit"] ?? "0.0"),
        maxLimit: double.parse(json["max_limit"] ?? "0.0"),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "min_limit": minLimit,
        "max_limit": maxLimit,
      };
}

class MyCard {
  int id;
  String cardId;
  int amount;
  String currency;
  String cardHolder;
  String brand;
  String type;
  String cardPan;
  String expiryMonth;
  String expiryYear;
  String cvv;
  String cardBackDetails;
  String cardBg;
  String siteTitle;
  String siteLogo;
  String status;
  bool isDefault;
  MyCardStatusInfo statusInfo;

  MyCard({
    required this.id,
    required this.cardId,
    required this.amount,
    required this.currency,
    required this.cardHolder,
    required this.brand,
    required this.type,
    required this.cardPan,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
    required this.cardBackDetails,
    required this.cardBg,
    required this.siteTitle,
    required this.siteLogo,
    required this.status,
    required this.isDefault,
    required this.statusInfo,
  });

  factory MyCard.fromJson(Map<String, dynamic> json) => MyCard(
        id: json["id"],
        cardId: json["card_id"],
        amount: json["amount"],
        currency: json["currency"],
        cardHolder: json["card_holder"],
        brand: json["brand"],
        type: json["type"],
        cardPan: json["card_pan"],
        expiryMonth: json["expiry_month"],
        expiryYear: json["expiry_year"],
        cvv: json["cvv"],
        cardBackDetails: json["card_back_details"],
        cardBg: json["card_bg"],
        siteTitle: json["site_title"],
        siteLogo: json["site_logo"],
        status: json["status"],
        isDefault: json["is_default"],
        statusInfo: MyCardStatusInfo.fromJson(json["status_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card_id": cardId,
        "amount": amount,
        "currency": currency,
        "card_holder": cardHolder,
        "brand": brand,
        "type": type,
        "card_pan": cardPan,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        "cvv": cvv,
        "card_back_details": cardBackDetails,
        "card_bg": cardBg,
        "site_title": siteTitle,
        "site_logo": siteLogo,
        "status": status,
        "is_default": isDefault,
        "status_info": statusInfo.toJson(),
      };
}

class MyCardStatusInfo {
  int block;
  int unblock;

  MyCardStatusInfo({
    required this.block,
    required this.unblock,
  });

  factory MyCardStatusInfo.fromJson(Map<String, dynamic> json) =>
      MyCardStatusInfo(
        block: json["block"],
        unblock: json["unblock"],
      );

  Map<String, dynamic> toJson() => {
        "block": block,
        "unblock": unblock,
      };
}

class SupportedCurrency implements DropdownModel {
  int id;
  String country;
  String name;
  String code;
  String type;
  double rate;
  int supportedCurrencyDefault;
  int status;
  DateTime createdAt;
  String currencyImage;

  SupportedCurrency({
    required this.id,
    required this.country,
    required this.name,
    required this.code,
    required this.type,
    required this.rate,
    required this.supportedCurrencyDefault,
    required this.status,
    required this.createdAt,
    required this.currencyImage,
  });

  factory SupportedCurrency.fromJson(Map<String, dynamic> json) =>
      SupportedCurrency(
        id: json["id"],
        country: json["country"],
        name: json["name"],
        code: json["code"],
        type: json["type"],
        rate: double.parse(json["rate"] ?? '0.0'),
        supportedCurrencyDefault: json["default"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        currencyImage: json["currencyImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "name": name,
        "code": code,
        "type": type,
        "rate": rate,
        "default": supportedCurrencyDefault,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "currencyImage": currencyImage,
      };

  @override
  String get title => name;
}

class Transaction {
  int id;
  String trx;
  String transactionType;
  String requestAmount;
  String payable;
  String exchangeRate;
  String totalCharge;
  String cardAmount;
  String cardNumber;
  String currentBalance;
  String status;
  DateTime dateTime;
  TransactionStatusInfo statusInfo;

  Transaction({
    required this.id,
    required this.trx,
    required this.transactionType,
    required this.requestAmount,
    required this.payable,
    required this.exchangeRate,
    required this.totalCharge,
    required this.cardAmount,
    required this.cardNumber,
    required this.currentBalance,
    required this.status,
    required this.dateTime,
    required this.statusInfo,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        trx: json["trx"],
        transactionType: json["transaction_type"],
        requestAmount: json["request_amount"],
        payable: json["payable"],
        exchangeRate: json["exchange_rate"],
        totalCharge: json["total_charge"],
        cardAmount: json["card_amount"],
        cardNumber: json["card_number"],
        currentBalance: json["current_balance"],
        status: json["status"],
        dateTime: DateTime.parse(json["date_time"]),
        statusInfo: TransactionStatusInfo.fromJson(json["status_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx": trx,
        "transaction_type": transactionType,
        "request_amount": requestAmount,
        "payable": payable,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "card_amount": cardAmount,
        "card_number": cardNumber,
        "current_balance": currentBalance,
        "status": status,
        "date_time": dateTime.toIso8601String(),
        "status_info": statusInfo.toJson(),
      };
}

class TransactionStatusInfo {
  int success;
  int pending;
  int rejected;

  TransactionStatusInfo({
    required this.success,
    required this.pending,
    required this.rejected,
  });

  factory TransactionStatusInfo.fromJson(Map<String, dynamic> json) =>
      TransactionStatusInfo(
        success: json["success"],
        pending: json["pending"],
        rejected: json["rejected"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "pending": pending,
        "rejected": rejected,
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
