import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/api.dart';
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
        journals = resp;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Encountered an error while fetching your request',
            ),
            const SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
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
            ),
          ],
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

    return ListView.builder(
      itemCount: journals!.length,
      itemBuilder: (ctx, idx) {
        final journal = journals![idx];
        return ListTile(
          leading: Text(
            (idx+1).toString(),
          ),
          title: Text(
            journal.title,
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
      ),
      body: body(context),
    );
  }
}
