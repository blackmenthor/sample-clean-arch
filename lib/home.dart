import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/api.dart';
import 'package:flutter_clean_arch/dialogs.dart';
import 'package:flutter_clean_arch/journal_add_page.dart';
import 'package:flutter_clean_arch/journal_single_page.dart';
import 'package:flutter_clean_arch/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  dynamic error;
  List<Journal>? journals;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      journals = null;
      error = null;
    });

    try {
      final resp = await api.getJournals();
      setState(() {
        journals = resp..sort((a, b) => a.date.compareTo(b.date));
      });
    } catch (ex) {
      setState(() {
        journals = null;
        error = ex;
      });
    }
  }

  Widget body(BuildContext context) {
    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Encountered an error while fetching your request',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16,),
              MaterialButton(
                onPressed: () {
                  fetchData();
                },
                color: Colors.blue,
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (journals == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text(
              'Loading your data, please wait...',
            ),
          ],
        ),
      );
    }

    if (journals!.isEmpty) {
      return const Center(
        child: Text(
          'There are no journals here yet...\n'
              'Create journal by clicking on + button above',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: journals!.length,
      itemBuilder: (ctx, idx) {
        final journal = journals![idx];
        return ListTile(
          onTap: () async {
            final resp = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => JournalSinglePage(id: journal.id)),
            );
            if (resp ?? false) {
              fetchData();
            }
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              journal.thumbnail,
              height: 96,
              width: 96,
            ),
          ),
          title: Text(
            journal.title,
          ),
          subtitle: Text(
            journal.body,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Journals',
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final newJournal = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const JournalAddPage(),
                    ),
                );
                if (newJournal != null) {
                  setState(() {
                    journals = [newJournal, ...journals!];
                  });
                }
              },
              icon: const Icon(
                Icons.add,
                size: 18.0,
                color: Colors.white,
              ),
          ),
          IconButton(
              onPressed: () {
                showLogoutDialog(context: context);
              },
              icon: const Icon(
                Icons.logout,
                size: 18.0,
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: body(context),
    );
  }
}
