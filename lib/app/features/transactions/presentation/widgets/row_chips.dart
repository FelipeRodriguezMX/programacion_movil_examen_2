part of './widgets.dart';

class RowChips extends StatefulWidget {
  const RowChips({Key? key, required this.cardNumber}) : super(key: key);
  final String cardNumber;
  @override
  State<RowChips> createState() => _RowChipsState();
}

class _RowChipsState extends State<RowChips> {
  int? value = 0;

  @override
  Widget build(BuildContext context) {
    final _choiceChip = ChoiceChipOptions().transactionChoiceFilter();
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Transacciones',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Row(
          children: List.generate(
            _choiceChip.length,
            (index) => CustomChoiceChip(
              text: _choiceChip[index].text,
              isSelected: value == index,
              onSelect: (bool selected) {
                setState(() => value = index);
                final _transactionType = TransactionType.values
                    .where((i) => i.name == _choiceChip[index].enumNameValue)
                    .toList();
                final selectedEnum =
                    TransactionType.values[_transactionType[0].index];
                transactionProvider
                  ..getTransactions(
                    transaction: selectedEnum,
                    cardNumber: widget.cardNumber,
                  )
                  ..notify();
              },
            ),
          ),
        )
      ],
    );
  }
}
