import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:law_library/l10n/app_localizations.dart';
import 'package:law_library/providers/law_provider.dart';
import 'package:law_library/providers/theme_provider.dart';

import 'package:law_library/widgets/bottom_navigation.dart';
import 'package:law_library/widgets/search_bar.dart';
import 'package:law_library/widgets/law_list.dart';

import 'package:law_library/screens/favorites_screen.dart';
import 'package:law_library/screens/payment_screen.dart';
import 'package:law_library/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  int _currentIndex = 0;
  Timer? _debounce;

  bool _isOffline = false;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LawProvider>().fetchLaws(reset: true);
    });
  }

  Future<void> _initConnectivity() async {
    final results = await Connectivity().checkConnectivity();
    _updateOfflineState(results);
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateOfflineState);
  }

  void _updateOfflineState(List<ConnectivityResult> results) {
    final offline = results.every((r) => r == ConnectivityResult.none);
    if (mounted && offline != _isOffline) {
      setState(() => _isOffline = offline);
    }
  }

  void _handleSearch(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<LawProvider>().setSearchQuery(query.isEmpty ? null : query);
    });
  }

  void _onTabChanged(int index) {
    setState(() => _currentIndex = index);
  }

  Widget _buildOfflineBanner() {
    return AnimatedSlide(
      offset: _isOffline ? Offset.zero : const Offset(0, -1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: _isOffline ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: double.infinity,
          color: Colors.orange.shade700,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Row(
            children: [
              Icon(Icons.wifi_off, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'You\'re offline — results may be limited or unavailable',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips(BuildContext context, LawProvider provider) {
    final categories = provider.categories;
    final selected = provider.selectedCategory;

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isAll = index == 0;
          final cat = isAll ? null : categories[index - 1];
          final isSelected = isAll ? selected == null : selected == cat;

          return ChoiceChip(
            label: Text(isAll ? 'All' : cat!),
            selected: isSelected,
            onSelected: (_) {
              provider.setFilterCategory(cat);
              if (_scrollController.hasClients) {
                _scrollController.jumpTo(0);
              }
            },
            labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            visualDensity: VisualDensity.compact,
          );
        },
      ),
    ).animate().fadeIn(duration: 300.ms, delay: 100.ms);
  }

  Widget _buildHomeBody(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _buildOfflineBanner(),

        // Logo header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Column(
            children: [
              Image.asset('assets/logo.png', width: 64, height: 64),
              const SizedBox(height: 8),
              Text(
                l10n.homeTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
          child: AppSearchBar(
            controller: _searchController,
            focusNode: _searchFocusNode,
            hintText: l10n.searchHint,
            onSearch: _handleSearch,
          ).animate().fadeIn(duration: 300.ms),
        ),

        // Category filter chips
        Consumer<LawProvider>(
          builder: (context, provider, _) =>
              _buildCategoryChips(context, provider),
        ),

        const SizedBox(height: 8),

        // Results count
        Consumer<LawProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading || provider.laws.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.searchFound(provider.laws.length, provider.searchQuery ?? ''),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ).animate().fadeIn(duration: 200.ms),
              ),
            );
          },
        ),

        const SizedBox(height: 4),

        // Law list
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LawList(scrollController: _scrollController),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final tabLabels = [
      l10n.tabHome,
      l10n.tabFavorites,
      l10n.tabPayment,
      l10n.tabSettings,
    ];

    final tabScreens = [
      const SizedBox(),
      const FavoritesScreen(),
      const PaymentScreen(),
      const SettingsScreen(),
    ];

    final safeIndex = _currentIndex.clamp(0, tabLabels.length - 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(tabLabels[safeIndex]),
      ),
      body: safeIndex == 0
          ? _buildHomeBody(context, l10n)
          : tabScreens[safeIndex],
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: safeIndex,
        onTap: _onTabChanged,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debounce?.cancel();
    _scrollController.dispose();
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}
