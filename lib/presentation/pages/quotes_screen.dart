import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
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
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            'Make your first Investment today',
                            style: TextStyle(color: Colors.white),
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
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.bar_chart),
                                  Text('Top n GBP'),
                                  Text('106,045'),
                                  Text('(+0.66%)',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.add),
                                  Text('Bitcoin'),
                                  Text('106,045'),
                                  Text('(+0.58%)',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.euro_outlined),
                                  Text('US GBP Call PTP'),
                                  Text('105,014'),
                                  Text('(-0.04%)',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text('Favourites'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text('WATCHLIST 1'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text('WATCHLIST 2'),
                                ),
                              ),
                              Container(
                                color: Colors.grey[200],
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Script',
                                    style: TextStyle(color: Color(0xFF7F7F7F)),
                                  ),
                                  Text(
                                    'Bid',
                                    style: TextStyle(color: Color(0xFF7F7F7F)),
                                  ),
                                  Text(
                                    'Ask',
                                    style: TextStyle(color: Color(0xFF7F7F7F)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              ...List.generate(quotes.length, (index) {
                                final quote = quotes[index];
                                return ListTile(
                                  title: Text(quote.symbol),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('${quote.bid}'),
                                      const SizedBox(width: 8.0),
                                      const Icon(Icons.arrow_drop_up),
                                      Text('${quote.ask}'),
                                      const SizedBox(width: 8.0),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
              Icons.show_chart,
              color: Colors.grey,
            ),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
