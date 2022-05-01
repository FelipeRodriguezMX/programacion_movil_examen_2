part of './widgets.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({Key? key}) : super(key: key);

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  final _cardNumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _cviController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cardNumberController.text = generateNumber(16);
    _cviController.text = generateNumber(4);
  }

  @override
  void dispose() {
    super.dispose();
    _cardNumberController.dispose();
    _amountController.dispose();
    _cviController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Agregar tarjeta',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: Column(
                children: [
                  InputWithValidation(
                    label: 'Numero de cuenta',
                    hintText: context
                        .read<UserProvider>()
                        .user!
                        .accountNumber
                        .toString(),
                    readOnly: true,
                  ),
                  InputWithValidation(
                    label: 'Numero de tarjeta',
                    hintText: _cardNumberController.text,
                    readOnly: true,
                  ),
                  InputWithValidation(
                    label: 'Cantidad a iniciar',
                    hintText: 'Cantidad',
                    keyboardType: TextInputType.number,
                    onChanged: (String value) => _amountController.text = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Campo vació';
                      if (double.parse(_amountController.text) <= 100.00) {
                        return 'Cantidad no valida';
                      }
                      return null;
                    },
                  ),
                  InputWithValidation(
                    label: 'CVI',
                    hintText: _cviController.text,
                    readOnly: true,
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    title: 'Agregar tarjeta',
                    onPressed: () => _addCard(),
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

  void _addCard() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    context.read<UserProvider>().addCard(
          context: context,
          total: double.parse(_amountController.text),
          cardNumber: _cardNumberController.text,
          cvi: int.parse(_cviController.text),
        );
    Navigator.of(context).pop();
  }
}
