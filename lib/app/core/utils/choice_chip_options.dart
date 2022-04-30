import 'package:tarjetas/app/core/core_domain/entities/choice_chip_options.dart';
import 'package:tarjetas/app/core/utils/enums.dart';

class ChoiceChipOptions {
  List<ChoiceChips> transactionChoiceFilter() {
    return <ChoiceChips>[
      ChoiceChips(
        text: 'Todos',
        enumNameValue: TransactionType.all.name,
      ),
      ChoiceChips(
        text: 'Depósitos',
        enumNameValue: TransactionType.deposits.name,
      ),
      ChoiceChips(
        text: 'Envíos',
        enumNameValue: TransactionType.withdraw.name,
      ),
    ];
  }
}
