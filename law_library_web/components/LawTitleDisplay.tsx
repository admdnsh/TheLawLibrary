'use client';

import { useLanguage } from '@/components/LanguageProvider';
import type { Law } from '@/types';

export default function LawTitleDisplay({ law }: { law: Law }) {
  const { language } = useLanguage();
  return (
    <h1 className="text-2xl font-bold leading-snug">
      {language === 'ms' && law.Title_MS ? law.Title_MS : law.Title}
    </h1>
  );
}
