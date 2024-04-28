import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:partwork/data/datasources/binance_data_source.dart';
import 'package:partwork/data/repositories/binance_repository_impl.dart';
import 'package:partwork/domain/usecases/get_quotes.dart';
import 'package:partwork/presentation/quotes_bloc/quotes_bloc.dart';
import 'package:partwork/presentation/quotes_bloc/quotes_event.dart';
import 'package:partwork/presentation/quotes_bloc/quotes_state.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: const Color(0xFFF5F5F5),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: AppBar(
                backgroundColor: Colors.white,
                title: const Center(
                  child: Text(
                    'Quotes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            body: BlocProvider(
              create: (_) => QuotesBloc(
                  getQuotes:
                      GetQuotes(BinanceRepositoryImpl(BinanceDataSourceImpl())))
                ..add(FetchQuotes()),
              child: BlocBuilder<QuotesBloc, QuotesState>(
                builder: (context, state) {
                  if (state is QuotesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is QuotesLoaded) {
                    final quotes = state.quotes;
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFF005BE3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome Agilan.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Advent Pro',
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              const Text(
                                'Make your first Investment today',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Advent Pro',
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Invest Today',
                                    style: TextStyle(
                                        fontFamily: 'Advent Pro',
                                        color: Color(0xFF0063F5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 30),
                                      Container(
                                        height: 18.0,
                                        width: 18.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF0091BA),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '100',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'EUR to USD',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 5.0,
                                        width: 5.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    '106,385',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text('-0.00884(-103%)',
                                      style: TextStyle(
                                          color: Color(0xFFD90429),
                                          fontSize: 7,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              const Gap(4),
                              Container(
                                height: 60,
                                width: 2,
                                color: const Color(0xFFEAEAEA),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Container(
                                        height: 18.0,
                                        width: 18.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFE3C84C),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '100',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Bitcoin',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 5.0,
                                        width: 5.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    '106,385',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text('+0.58%',
                                      style: TextStyle(
                                          color: Color(0xFF00B060),
                                          fontSize: 7,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              const Gap(4),
                              Container(
                                height: 70,
                                width: 2,
                                color: const Color(0xFFEAEAEA),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Container(
                                        height: 18.0,
                                        width: 18.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF0091BA),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          '100',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 2),
                                      const Text(
                                        'US 100 Cash CFD',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 5.0,
                                        width: 5.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    '106,385',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text('-234.40(-103%)',
                                      style: TextStyle(
                                          color: Color(0xFFD90429),
                                          fontSize: 7,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TabBar(
                          tabs: [
                            Tab(
                                child: Text('Favourites',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10))),
                            Tab(
                                child: Text('WATCHLIST 1',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10))),
                            Tab(
                                child: Text('WATCHLIST 2',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Script',
                                            style: TextStyle(
                                                color: Color(0xFF7F7F7F)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Bid',
                                            style: TextStyle(
                                                color: Color(0xFF7F7F7F)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Ask',
                                            style: TextStyle(
                                                color: Color(0xFF7F7F7F)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    ...List.generate(quotes.length, (index) {
                                      final quote = quotes[index];
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Text(
                                                quote.symbol,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: const Color.fromARGB(
                                                      255, 224, 240, 232)
                                                  .withOpacity(0.4),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Text(
                                                '${quote.bid}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: const Color(0x1AD51831),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Text(
                                                '${quote.ask}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              const Center(
                                child: Text('WATCHLIST 1'),
                              ),
                              const Center(
                                child: Text('WATCHLIST 2'),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else if (state is QuotesError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.trending_up,
                    color: Colors.grey,
                  ),
                  label: 'Markets',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.grid_view,
                    color: Colors.grey,
                  ),
                  label: 'Watchlist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.grid_view,
                    color: Colors.grey,
                  ),
                  label: 'Watchlist',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
