import 'package:anime/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/anime_preview_cubit.dart';
import 'widgets/anime_cover_image.dart';

class AnimePreviewView extends StatefulWidget {
  final AnimePreviewCubit? cubit;
  const AnimePreviewView({
    super.key,
    this.cubit,
  });

  @override
  State<AnimePreviewView> createState() => _AnimePreviewViewState();
}

class _AnimePreviewViewState extends State<AnimePreviewView> {
  late AnimePreviewCubit _cubit;
  int _currentIndex = 0;

  @override
  void initState() {
    _cubit = widget.cubit ?? AnimePreviewCubit();
    _cubit.fetchAnimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<AnimePreviewCubit, AnimePreviewState>(
        bloc: _cubit,
        builder: (context, state) {
          // Loading state
          if (state is AnimePreviewLoading) {
            return Container(
              color: const Color(0xff040B1C).withOpacity(0.6),
              alignment: Alignment.center,
              child: const CircularProgressIndicator.adaptive(),
            );
          }

          // Error state
          if (state is AnimePreviewError) {
            return Container(
              color: const Color(0xff040B1C).withOpacity(0.6),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                state.message ?? '',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.orangeAccent,
                  fontSize: 10,
                ),
              ),
            );
          }

          // Loaded state
          if (state is AnimePreviewLoaded) {
            final media = state.medias?.elementAt(_currentIndex);

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AnimeCoverImage(
                    image: media?.bannerImage ?? '',
                    height: size.height,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: size.height,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff040B1C),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (StringUtil.isEmpty(
                                          media?.title?.english)) {
                                        return Text(
                                          media?.title?.native ?? '--',
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            fontSize: 32,
                                          ),
                                        );
                                      }

                                      return Text(
                                        media?.title?.english ?? '--',
                                        softWrap: true,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 32,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          media?.seasonYear?.toString() ?? '--',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: ' ',
                                        ),
                                        const TextSpan(
                                          text: '-',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' ',
                                        ),
                                        const TextSpan(
                                          text: '|',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' ',
                                        ),
                                        TextSpan(
                                          text:
                                              media?.genres?.join(', ') ?? '--',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    softWrap: true,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            ),
                            IconButton.filled(
                              color: const Color(0xffCC3838),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          media?.description ?? '--',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 47,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton.filled(
                              color: const Color(0xffCC3838),
                              onPressed: () {
                                setState(() {
                                  if (_currentIndex > 0) {
                                    _currentIndex--;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            IconButton.filled(
                              color: const Color(0xffCC3838),
                              onPressed: () {
                                setState(() {
                                  if (_currentIndex <
                                      state.medias!.length - 1) {
                                    _currentIndex++;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          // Initial state
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
