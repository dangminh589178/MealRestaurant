import 'package:demoflutter/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
} //PC03BB0157909
//111673

class Filterscreen extends ConsumerStatefulWidget {
  const Filterscreen({super.key});
  @override
  ConsumerState<Filterscreen> createState() => _Filterscreen();
}

class _Filterscreen extends ConsumerState<Filterscreen> {
  Map<Filter, bool> filterStateLocal = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  @override
  void initState() {
    super.initState();
    //inital value
    final activeFilter =
        ref.read(FilterNotifer.filterProvider); //Map<Filter, bool>
    filterStateLocal[Filter.glutenFree] = activeFilter[Filter.glutenFree]!;
    filterStateLocal[Filter.lactoseFree] = activeFilter[Filter.lactoseFree]!;
    filterStateLocal[Filter.vegetarian] = activeFilter[Filter.vegetarian]!;
    filterStateLocal[Filter.vegan] = activeFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // impl drawer
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          ref
              .read(FilterNotifer.filterProvider.notifier)
              .setMapFilter(filterStateLocal);
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
                activeColor: const Color.fromARGB(255, 89, 151, 91),
                contentPadding: EdgeInsets.only(left: 34, right: 20),
                subtitle: Text("Only include gluten"),
                title: Text("Gluten-free"),
                value: filterStateLocal[Filter.glutenFree] ?? false,
                onChanged: (value) {
                  setState(() {
                    filterStateLocal[Filter.glutenFree] = value;
                  });
                }),
            SwitchListTile(
                activeColor: const Color.fromARGB(255, 89, 151, 91),
                contentPadding: EdgeInsets.only(left: 34, right: 20),
                subtitle: Text("Only include lactose"),
                title: Text("Lactose-free"),
                value: filterStateLocal[Filter.lactoseFree] ?? false,
                onChanged: (value) {
                  setState(() {
                    filterStateLocal[Filter.lactoseFree] = value;
                  });
                }),
            SwitchListTile(
                activeColor: const Color.fromARGB(255, 89, 151, 91),
                contentPadding: EdgeInsets.only(left: 34, right: 20),
                subtitle: Text("Only include vegetarian"),
                title: Text("Vegetarian"),
                value: filterStateLocal[Filter.vegetarian] ?? false,
                onChanged: (value) {
                  setState(() {
                    filterStateLocal[Filter.vegetarian] = value;
                  });
                }),
            SwitchListTile(
                contentPadding: EdgeInsets.only(left: 34, right: 20),
                activeColor: Colors.green,
                subtitle: Text("Only include vegan"),
                title: Text("Vegan"),
                value: filterStateLocal[Filter.vegan] ?? false,
                onChanged: (value) {
                  setState(() {
                    filterStateLocal[Filter.vegan] = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
