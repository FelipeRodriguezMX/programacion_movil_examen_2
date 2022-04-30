part of '../widgets.dart';

class TransactionModal extends StatefulWidget {
  const TransactionModal({Key? key, required this.cardNumber})
      : super(key: key);
  final String cardNumber;
  @override
  State<TransactionModal> createState() => _TransactionModalState();
}

class _TransactionModalState extends State<TransactionModal> {
  TextEditingController? _amountController;
  final _formKey = GlobalKey<FormState>();
  int groupValue = 1;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _amountController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Realizar transacción',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputWithValidation(
                    hintText: 'Cantidad',
                    label: 'Cantidad',
                    onChanged: (String value) =>
                        _amountController!.text = value,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final amount =
                          Provider.of<UserProvider>(context, listen: false)
                              .getCard(widget.cardNumber)
                              .total;
                      if (value == null || value.isEmpty) {
                        return 'Campo vació';
                      }
                      if (groupValue == 2 && double.parse(value) > amount) {
                        return 'Cantidad no permitida';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Text(
                      'Tipo de transacción',
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                  CustomRadioListTile(
                    groupValue: groupValue,
                    label: 'Deposito',
                    valueIndex: 1,
                    onChange: (int? value) {
                      setState(() => groupValue = value!);
                    },
                  ),
                  CustomRadioListTile(
                    groupValue: groupValue,
                    label: 'Envió',
                    valueIndex: 2,
                    onChange: (int? value) {
                      setState(() => groupValue = value!);
                    },
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    title: 'Realizar transacción',
                    onPressed: () => runTransaction(),
                    borderRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void runTransaction() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    // Provider.of<TransactionProvider>(context, listen: false).addTransaction(
    //   amount: _amountController!.text,
    //   card: widget.cardNumber,
    //   type: groupValue,
    // );
    Navigator.of(context).pop();
  }
}
