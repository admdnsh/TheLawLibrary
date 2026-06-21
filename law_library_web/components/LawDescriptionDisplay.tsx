'use client';

import { useLanguage } from '@/components/LanguageProvider';
import type { Law } from '@/types';

export default function LawDescriptionDisplay({ law }: { law: Law }) {
  const { t, language } = useLanguage();
  const text = language === 'ms' && law.Description_MS ? law.Description_MS : law.Description;

  return (
    <div className="rounded-2xl p-6 mb-4" style={{ background: 'var(--card-bg)', border: '1px solid var(--border)' }}>
      <h2 className="text-xs font-semibold uppercase tracking-wide mb-3" style={{ color: 'var(--muted)' }}>
        {t.description}
      </h2>
      <p className="text-sm leading-relaxed whitespace-pre-line">{text}</p>
    </div>
  );
}
