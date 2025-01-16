
class SendMoneyInfoModel {
  SendMoneyInfoModel({
    required this.message,
    required this.data,
  });

  final Message message;
  final Data data;

  factory SendMoneyInfoModel.fromJson(Map<String, dynamic> json) =>
      SendMoneyInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
 

  final dynamic baseCurr;
  dynamic baseCurrRate;
  GetRemainingFields getRemainingFields;
  final SendMoneyCharge sendMoneyCharge;
  final List<Transaction> transactions;

 Data({
    required this.baseCurr,
    required this.baseCurrRate,
    required this.getRemainingFields,

    required this.sendMoneyCharge,
    required this.transactions,
  });
  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        baseCurr: json["base_curr"] ?? '',
        baseCurrRate: double.parse(json["base_curr_rate"] ?? "0.0"),
          getRemainingFields: GetRemainingFields.fromJson(json["get_remaining_fields"]),
        sendMoneyCharge: SendMoneyCharge.fromJson(json["sendMoneyCharge"]),
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "base_curr_rate": baseCurrRate,
                "get_remaining_fields": getRemainingFields.toJson(),
        "sendMoneyCharge": sendMoneyCharge.toJson(),
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class GetRemainingFields {
    String transactionType;
    String attribute;

    GetRemainingFields({
        required this.transactionType,
        required this.attribute,
    });

    factory GetRemainingFields.fromJson(Map<String, dynamic> json) => GetRemainingFields(
        transactionType: json["transaction_type"],
        attribute: json["attribute"],
    );

    Map<String, dynamic> toJson() => {
        "transaction_type": transactionType,
        "attribute": attribute,
    };
}
class SendMoneyCharge {
  SendMoneyCharge({
    required this.id,
    required this.slug,
    required this.title,
    required this.fixedCharge,
    required this.percentCharge,
    required this.minLimit,
    required this.maxLimit,
    required this.monthlyLimit,
    required this.dailyLimit,
  });

  final dynamic id;
  final dynamic slug;
  final dynamic title;
  final dynamic fixedCharge;
  final dynamic percentCharge;
  final dynamic minLimit;
  final dynamic maxLimit;
  final dynamic monthlyLimit;
  final dynamic dailyLimit;

  factory SendMoneyCharge.fromJson(Map<String, dynamic> json) =>
      SendMoneyCharge(
        id: json["id"] ?? '',
        slug: json["slug"] ?? '',
        title: json["title"] ?? '',
        fixedCharge: double.parse(json["fixed_charge"] ?? "0.0"),
        percentCharge: double.parse(json["percent_charge"] ?? "0.0"),
        minLimit: double.parse(json["min_limit"] ?? "0.0"),
        maxLimit: double.parse(json["max_limit"] ?? "0.0"),
        monthlyLimit: double.parse(json["monthly_limit"] ?? "0.0"),
        dailyLimit: double.parse(json["daily_limit"] ?? "0.0"),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "monthly_limit": monthlyLimit,
        "daily_limit": dailyLimit,
      };
}

class Transaction {
  Transaction({
    required this.id,
    required this.type,
    required this.trx,
    required this.transactionType,
    required this.requestAmount,
    required this.totalCharge,
    required this.payable,
    required this.recipientReceived,
    required this.currentBalance,
    required this.status,
    required this.dateTime,
    required this.statusInfo,
  });

  final dynamic id;
  final dynamic type;
  final dynamic trx;
  final dynamic transactionType;
  final dynamic requestAmount;
  final dynamic totalCharge;
  final dynamic payable;
  final dynamic recipientReceived;
  final dynamic currentBalance;
  final dynamic status;
  final DateTime dateTime;
  final StatusInfo statusInfo;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        type: json["type"] ?? '',
        trx: json["trx"] ?? '',
        transactionType: json["transaction_type"] ?? '',
        requestAmount: json["request_amount"] ?? '',
        totalCharge: json["total_charge"] ?? '',
        payable: json["payable"] ?? '',
        recipientReceived: json["recipient_received"] ?? '',
        currentBalance: json["current_balance"] ?? '',
        status: json["status"] ?? '',
        dateTime: DateTime.parse(json["date_time"]),
        statusInfo: StatusInfo.fromJson(json["status_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "trx": trx,
        "transaction_type": transactionType,
        "request_amount": requestAmount,
        "total_charge": totalCharge,
        "payable": payable,
        "recipient_received": recipientReceived,
        "current_balance": currentBalance,
        "status": status,
        "date_time": dateTime.toIso8601String(),
        "status_info": statusInfo.toJson(),
      };
}

class StatusInfo {
  StatusInfo({
    required this.success,
    required this.pending,
    required this.rejected,
  });

  final dynamic success;
  final dynamic pending;
  final dynamic rejected;

  factory StatusInfo.fromJson(Map<String, dynamic> json) => StatusInfo(
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
  Message({
    required this.success,
  });

  final List<String> success;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
