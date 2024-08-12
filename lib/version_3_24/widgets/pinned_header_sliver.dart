import 'package:flutter/material.dart';

/// Flutter code sample for [PinnedHeaderSliver].

class PinnedHeaderSliverExample extends StatefulWidget {
  const PinnedHeaderSliverExample({super.key});

  @override
  State<PinnedHeaderSliverExample> createState() => _PinnedHeaderSliverExampleState();
}

class _PinnedHeaderSliverExampleState extends State<PinnedHeaderSliverExample> {
  int count = 0;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Widget header = Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.all(4),
      child: Material(
        color: colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 7,
            color: colorScheme.outline,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Text(
            count.isOdd ? 'Alternative Title\nWith Two Lines' : 'PinnedHeaderSliver',
            style: theme.textTheme.headlineMedium!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              //TODO: the new widget
              PinnedHeaderSliver(child: header),
              const ItemList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// A placeholder SliverList of 25 items.
class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    this.itemCount = 25,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            color: colorScheme.onSecondary,
            child: ListTile(
              textColor: colorScheme.secondary,
              title: Text('Item $index'),
            ),
          );
        },
        childCount: itemCount,
      ),
    );
  }
}
