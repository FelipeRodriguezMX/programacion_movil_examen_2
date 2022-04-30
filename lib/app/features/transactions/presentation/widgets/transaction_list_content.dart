part of './widgets.dart';

class TransactionListContent extends StatelessWidget {
  const TransactionListContent({Key? key, required this.transactions})
      : super(key: key);
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (BuildContext content, int index) => TransactionListTile(
            transaction: transactions[index],
          ),
        ),
      ],
    );
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(
          '\$ ${transaction.amount}',
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(transaction.type),
        iconColor: transaction.type == 'deposito' ? Colors.green : Colors.red,
        trailing: Icon(
          transaction.type == 'deposito'
              ? Icons.arrow_downward
              : Icons.arrow_upward,
        ),
      ),
    );
  }
}
