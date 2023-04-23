import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/widgets/movie_list_item.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1500) {
      return 5;
    } else if (width > 1000) {
      return 4;
    } else if (width > 700) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieProvider = ref.watch(findAllMoviesProvider);

    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('Home'),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return movieProvider.map(
              data: (moviesObj) {
                final movies = moviesObj.value;
                if (movies.isNotEmpty) {
                  var size = MediaQuery.of(context).size;
                  final double itemHeight = (size.height) / 0.75;
                  final double itemWidth = size.width / 2;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateCrossAxisCount(context),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (_, index) => MovieListItem(
                      movies[index],
                      height: itemHeight,
                    ),
                    itemCount: movies.length,
                    padding: const EdgeInsets.all(10),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Downloading and reading playlist..."),
                        ProgressCircle(),
                      ],
                    ),
                  );
                }
              },
              error: (error) => Container(),
              loading: (_) => const Center(
                child: ProgressCircle(),
              ),
            );
          },
        ),
      ],
    );
  }
}
