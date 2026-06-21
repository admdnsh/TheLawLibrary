import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:law_library/providers/law_provider.dart';
import 'package:law_library/widgets/law_list_item.dart';
import 'package:law_library/screens/law_detail_screen.dart';
import 'package:law_library/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:law_library/providers/theme_provider.dart';
import 'package:law_library/l10n/app_localizations.dart';

class LawList extends StatefulWidget {
  final ScrollController scrollController;
  const LawList({super.key, required this.scrollController});

  @override
  State<LawList> createState() => _LawListState();
}

// ── Skeleton card shown while results load ─────────────────────────────────

class _SkeletonCard extends StatelessWidget {
  final UiDensity density;
  const _SkeletonCard({required this.density});

  Widget _block(BuildContext context, {double? width, required double height}) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppTheme.getSpacing(AppTheme.baseSpacing12, density),
      ),
      child: Container(
        padding: EdgeInsets.all(
          AppTheme.getSpacing(AppTheme.baseSpacing16, density),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(
            AppTheme.getSpacing(AppTheme.borderRadiusMedium, density),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              _block(context, width: 70, height: 22),
              SizedBox(width: AppTheme.getSpacing(8, density)),
              _block(context, width: 90, height: 22),
            ]),
            SizedBox(height: AppTheme.getSpacing(AppTheme.baseSpacing8, density)),
            _block(context, height: 14),
            SizedBox(height: AppTheme.getSpacing(AppTheme.baseSpacing4, density)),
            _block(context, width: 200, height: 14),
            SizedBox(height: AppTheme.getSpacing(AppTheme.baseSpacing4, density)),
            _block(context, width: 110, height: 11),
          ],
        ),
      ).animate(onPlay: (c) => c.repeat()).shimmer(
            duration: 1200.ms,
            color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
          ),
    );
  }
}

// ── Main list widget ───────────────────────────────────────────────────────

class _LawListState extends State<LawList> {
  void _goToPage(LawProvider provider, Future<void> Function() action) async {
    await action();
    if (widget.scrollController.hasClients) {
      widget.scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<LawProvider>(
      builder: (context, lawProvider, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final uiDensity = themeProvider.uiDensity;

        // ── Loading state ────────────────────────────────────────
        if (lawProvider.isLoading && lawProvider.laws.isEmpty) {
          return ListView(
            padding: EdgeInsets.only(
              top: AppTheme.getSpacing(AppTheme.baseSpacing8, uiDensity),
            ),
            children: List.generate(
              10,
              (i) => _SkeletonCard(density: uiDensity)
                  .animate(delay: Duration(milliseconds: i * 50))
                  .fadeIn(duration: 250.ms),
            ),
          );
        }

        // ── No results state ─────────────────────────────────────
        if (!lawProvider.isLoading && lawProvider.laws.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 56,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
                  ),
                  SizedBox(
                      height: AppTheme.getSpacing(
                          AppTheme.baseSpacing16, uiDensity)),
                  Text(
                    l10n.noResultsFound,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                      height:
                          AppTheme.getSpacing(AppTheme.baseSpacing8, uiDensity)),
                  Text(
                    l10n.noResultsHint,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ).animate().fadeIn().scale(),
            ),
          );
        }

        // ── Law list + pagination ─────────────────────────────────
        return Column(
          children: [
            // Cached results banner
            if (lawProvider.isFromCache)
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                color: Colors.orange.withOpacity(0.12),
                child: Row(
                  children: [
                    const Icon(Icons.offline_bolt_outlined,
                        size: 14, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text(
                      'Showing cached results',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.orange[700],
                          ),
                    ),
                  ],
                ),
              ),

            // List
            Expanded(
              child: Scrollbar(
                controller: widget.scrollController,
                thumbVisibility: true,
                thickness: 6,
                radius: const Radius.circular(8),
                child: lawProvider.isLoading
                    ? ListView(
                        padding: EdgeInsets.only(
                          top: AppTheme.getSpacing(
                              AppTheme.baseSpacing8, uiDensity),
                        ),
                        children: List.generate(
                          10,
                          (i) => _SkeletonCard(density: uiDensity)
                              .animate(delay: Duration(milliseconds: i * 50))
                              .fadeIn(duration: 250.ms),
                        ),
                      )
                    : ListView.builder(
                        controller: widget.scrollController,
                        itemCount: lawProvider.laws.length,
                        itemBuilder: (context, index) {
                          final law = lawProvider.laws[index];
                          return LawListItem(
                            law: law,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LawDetailScreen(law: law),
                                ),
                              );
                            },
                          )
                              .animate()
                              .fadeIn(
                                duration: const Duration(milliseconds: 350),
                                delay: Duration(
                                    milliseconds: (index % 10) * 35),
                              )
                              .slideX(
                                begin: 0.08,
                                end: 0,
                                duration: const Duration(milliseconds: 350),
                                delay: Duration(
                                    milliseconds: (index % 10) * 35),
                                curve: Curves.easeOutQuad,
                              );
                        },
                      ),
              ),
            ),

            // ── Pagination controls ───────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withOpacity(0.5),
                  ),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous button
                  FilledButton.tonal(
                    onPressed: lawProvider.hasPreviousPage && !lawProvider.isLoading
                        ? () => _goToPage(
                            lawProvider, lawProvider.previousPage)
                        : null,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.chevron_left, size: 18),
                        SizedBox(width: 2),
                        Text('Prev', style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),

                  // Page indicator
                  Text(
                    'Page ${lawProvider.currentPage}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),

                  // Next button
                  FilledButton.tonal(
                    onPressed: lawProvider.hasNextPage && !lawProvider.isLoading
                        ? () => _goToPage(
                            lawProvider, lawProvider.nextPage)
                        : null,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Next', style: TextStyle(fontSize: 13)),
                        SizedBox(width: 2),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Error strip
            if (lawProvider.error != null)
              Container(
                padding: EdgeInsets.all(
                    AppTheme.getSpacing(AppTheme.baseSpacing16, uiDensity)),
                color: Theme.of(context).colorScheme.errorContainer,
                child: Row(
                  children: [
                    Icon(Icons.error,
                        color: Theme.of(context).colorScheme.error),
                    SizedBox(
                        width: AppTheme.getSpacing(
                            AppTheme.baseSpacing8, uiDensity)),
                    Expanded(
                      child: Text(
                        l10n.searchError(lawProvider.error!),
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: lawProvider.clearError,
                      color:
                          Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
