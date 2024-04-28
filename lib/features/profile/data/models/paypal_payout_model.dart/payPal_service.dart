class PayoutRequest {
  final String senderBatchHeader; // Optional
  final String recipientType; // Required (e.g., 'EMAIL')
  final String receiver; // Payee email or validated account ID
  final double amount;
  final String currency;
  final List<PayoutItem> items; // Optional

  PayoutRequest({
    required this.recipientType,
    required this.receiver,
    required this.amount,
    required this.currency,
    required this.senderBatchHeader,
    this.items = const [],
  });

  Map<String, dynamic> toJson() => {
        'sender_batch_header': senderBatchHeader,
        'recipient_type': recipientType,
        'receiver': receiver,
        'amount': {'value': amount.toString(), 'currency': currency},
        if (items.isNotEmpty)
          'items': items.map((item) => item.toJson()).toList(),
      };
}

class PayoutItem {
  final String name;
  final double quantity;
  final double price;
  final String currency; // Should match sending currency

  PayoutItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity.toString(),
        'price': {'value': price.toString(), 'currency': currency},
      };
}
