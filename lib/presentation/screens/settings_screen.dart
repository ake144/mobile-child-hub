import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_theme.dart';
import '../blocs/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final isAm = state.languageCode == 'am';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAm ? 'ቅንብሮች' : 'Settings',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).animate().fadeIn(),
                const SizedBox(height: 24),
                // Language
                _SettingsCard(
                  title: isAm ? 'ቋንቋ' : 'Language',
                  icon: Icons.language_rounded,
                  child: Row(
                    children: [
                      _LanguageButton(
                        label: 'English',
                        isSelected: !isAm,
                        onTap: () => context.read<SettingsBloc>().add(const ChangeLanguage('en')),
                      ),
                      const SizedBox(width: 12),
                      _LanguageButton(
                        label: 'አማርኛ',
                        isSelected: isAm,
                        onTap: () => context.read<SettingsBloc>().add(const ChangeLanguage('am')),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 100.ms),
                const SizedBox(height: 16),
                // Dark Mode
                _SettingsCard(
                  title: isAm ? 'ጨለማ ሁነታ' : 'Dark Mode',
                  icon: Icons.dark_mode_rounded,
                  trailing: Switch(
                    value: state.isDarkMode,
                    onChanged: (_) => context.read<SettingsBloc>().add(ToggleDarkMode()),
                    activeThumbColor: AppTheme.primaryColor,
                  ),
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: 16),
                // Sound
                _SettingsCard(
                  title: isAm ? 'ድምፅ' : 'Sound Effects',
                  icon: Icons.volume_up_rounded,
                  trailing: Switch(
                    value: state.isSoundEnabled,
                    onChanged: (_) => context.read<SettingsBloc>().add(ToggleSound()),
                    activeThumbColor: AppTheme.primaryColor,
                  ),
                ).animate().fadeIn(delay: 300.ms),
                const SizedBox(height: 16),
                // TTS
                _SettingsCard(
                  title: isAm ? 'ታሪክ ንባብ' : 'Read Stories Aloud',
                  icon: Icons.record_voice_over_rounded,
                  trailing: Switch(
                    value: state.isTTSEnabled,
                    onChanged: (_) => context.read<SettingsBloc>().add(ToggleTTS()),
                    activeThumbColor: AppTheme.primaryColor,
                  ),
                ).animate().fadeIn(delay: 400.ms),
                const SizedBox(height: 16),
                // TTS Speed
                if (state.isTTSEnabled)
                  _SettingsCard(
                    title: isAm ? 'የንባብ ፍጥነት' : 'Reading Speed',
                    icon: Icons.speed_rounded,
                    child: Slider(
                      value: state.ttsSpeed,
                      min: 0.2,
                      max: 1.0,
                      divisions: 8,
                      label: _getSpeedLabel(state.ttsSpeed, isAm),
                      onChanged: (v) => context.read<SettingsBloc>().add(ChangeTTSSpeed(v)),
                      activeColor: AppTheme.primaryColor,
                    ),
                  ).animate().fadeIn(delay: 500.ms),
                const SizedBox(height: 32),
                // About
                _SettingsCard(
                  title: isAm ? 'ስለ' : 'About',
                  icon: Icons.info_outline_rounded,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bible Stories v1.0.0',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isAm
                            ? 'ለልጆች መጽሐፍ ቅዱስ ታሪኮች'
                            : 'Interactive Bible Stories for Kids',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 600.ms),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getSpeedLabel(double speed, bool isAm) {
    if (speed <= 0.3) return isAm ? 'ቀስ' : 'Slow';
    if (speed <= 0.6) return isAm ? 'መደበኛ' : 'Normal';
    return isAm ? 'ፈጣን' : 'Fast';
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final Widget? child;

  const _SettingsCard({
    required this.title,
    required this.icon,
    this.trailing,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          if (child != null) ...[
            const SizedBox(height: 12),
            child!,
          ],
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : null,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
