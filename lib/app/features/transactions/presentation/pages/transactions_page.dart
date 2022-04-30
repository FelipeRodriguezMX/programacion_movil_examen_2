import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjetas/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:tarjetas/app/features/transactions/presentation/provider/transaction_provider.dart';
import 'package:tarjetas/app/features/transactions/presentation/widgets/widgets.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key, required this.cardNumber}) : super(key: key);
  final String cardNumber;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false)
        .initState(widget.cardNumber);
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(child: body());
  }

  Widget body() {
    final transaction = Provider.of<TransactionProvider>(context, listen: true);
    if (transaction.data == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (transaction.data!.isEmpty) {
      return const Center(child: Text('No hay transacciones'));
    }
    return TransactionContent(
      cardNumber: widget.cardNumber,
    );
  }
}

class TransactionContent extends StatelessWidget {
  const TransactionContent({Key? key, required this.cardNumber})
      : super(key: key);
  final String cardNumber;
  @override
  Widget build(BuildContext context) {
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    return Column(
      children: [
        RowChips(cardNumber: cardNumber),
        TransactionListContent(transactions: transactionProvider.data!),
      ],
    );
  }
}
