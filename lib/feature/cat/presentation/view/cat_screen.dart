import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium_publications/feature/cat/data/repo/cat_repo.dart';
import 'package:medium_publications/feature/cat/presentation/cubit/cat_cubit.dart';
import 'package:medium_publications/feature/cat/presentation/cubit/cat_state.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  late CatCubit _catCubit;

  @override
  void initState() {
    _catCubit = CatCubit(CatRepo());
    _catCubit.getCats();
    super.initState();
  }

  @override
  void dispose() {
    _catCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _catCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Cats')),
        body: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state is CatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CatLoaded) {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.cats.length,
                  itemBuilder: (context, index) {
                    final cat = state.cats[index];
                    return ListTile(
                      title: Text('${cat.name} (${cat.age})'),
                      subtitle: Text(cat.color),

                      trailing: Text(cat.gender),
                    );
                  },
                ),
              );
            } else if (state is CatError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    await _catCubit.getCats();
  }
}
