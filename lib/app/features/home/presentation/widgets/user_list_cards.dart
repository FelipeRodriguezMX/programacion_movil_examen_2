part of './widgets.dart';

class CardListContent extends StatelessWidget {
  const CardListContent({Key? key, required this.cards}) : super(key: key);
  final List<CardEntitie> cards;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cards.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed('/transactions', arguments: cards[index].cardNumber),
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Card(
                elevation: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 150,
                            child: Text(
                              'Super cuenta Universitaria',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              // textAlign: TextAlign.left,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$ ${cards[index].total} MXN',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        cards[index].cardNumber,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        // textAlign: TextAlign.left,
                      ),
                      const Spacer(),
                      Text(
                        '${cards[index].accountNumber}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}