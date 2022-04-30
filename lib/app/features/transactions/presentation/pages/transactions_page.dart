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
    return SimplePage(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      bottomAppBar: BottomAppBar(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: 70,
          child: CustomElevatedButton(
            title: 'Realizar transacción',
            onPressed: () => _transactionModal(),
            borderRadius: 10,
          ),
        ),
      ),
      child: Column(
        children: [
          RowChips(cardNumber: widget.cardNumber),
          body(),
        ],
      ),
    );
  }

  Widget body() {
    final transaction = Provider.of<TransactionProvider>(context, listen: true);
    if (transaction.data == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (transaction.data!.isEmpty) {
      return const Expanded(child: Center(child: Text('No hay transacciones')));
    }
    return TransactionListContent(transactions: transaction.data!);
  }

  Future<void> _transactionModal() async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.70,
          child: TransactionModal(cardNumber: widget.cardNumber),
        );
      },
    );
  }
}
