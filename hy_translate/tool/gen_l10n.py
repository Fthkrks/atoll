"""Generates lib/l10n/app_*.arb and lib/core/languages/language_names.g.dart.

Inputs: tool/l10n_src/*.txt (UI strings), CLDR language names taken from the
flutter_localized_locales pub package (dev-time only, not a runtime dependency).
Run: python tool/gen_l10n.py
"""
import glob
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'tool', 'l10n_src')
ARB_DIR = os.path.join(ROOT, 'lib', 'l10n')
CLDR = os.path.expanduser(
    '~/AppData/Local/Pub/Cache/hosted/pub.dev/flutter_localized_locales-2.0.5/data')

# Language codes of the translation languages (lib/core/languages/languages.dart)
LANG_CODES = ('zh en fr pt es ja tr ru ar ko th it de vi ms id fil hi zh-Hant pl cs nl '
              'km my fa gu ur te mr he bn ta uk bo kk mn ug yue').split()

PLACEHOLDERS = {'error': 'String', 'path': 'String', 'percent': 'String',
                'done': 'int', 'total': 'int'}


def arb_locale(code):
    return code.replace('-', '_')


# ---------------------------------------------------------------- strings
keys = open(os.path.join(SRC, '00_keys.txt'), encoding='utf8').read().split()
blocks = {}
for path in sorted(glob.glob(os.path.join(SRC, '0[1-9]_*.txt'))):
    cur = None
    for line in open(path, encoding='utf8').read().split('\n'):
        if line.startswith('== '):
            cur = line[3:].strip()
            blocks[cur] = []
        elif cur is not None and line != '':
            blocks[cur].append(line)

ok = True
want = {arb_locale(c) for c in LANG_CODES}
if set(blocks) != want:
    print('locale mismatch: missing', want - set(blocks), 'extra', set(blocks) - want)
    ok = False
for loc, lines in blocks.items():
    if len(lines) != len(keys):
        print('BAD LENGTH', loc, len(lines), 'expected', len(keys))
        ok = False
en = dict(zip(keys, blocks['en']))
for loc, lines in blocks.items():
    for k, v in zip(keys, lines):
        a = set(re.findall(r'\{(\w+)\}', en[k]))
        b = set(re.findall(r'\{(\w+)\}', v))
        if a != b:
            print('PLACEHOLDER MISMATCH', loc, k, a, b, v)
            ok = False
        if "'" in v:
            print('ASCII APOSTROPHE', loc, k)
            ok = False
if not ok:
    sys.exit(1)

os.makedirs(ARB_DIR, exist_ok=True)
for f in glob.glob(os.path.join(ARB_DIR, 'app_*.arb')):
    os.remove(f)
for loc, lines in blocks.items():
    d = {'@@locale': loc}
    for k, v in zip(keys, lines):
        d[k] = v
        if loc == 'en':
            ph = re.findall(r'\{(\w+)\}', v)
            if ph:
                d['@' + k] = {'placeholders': {p: {'type': PLACEHOLDERS[p]} for p in ph}}
    with open(os.path.join(ARB_DIR, f'app_{loc}.arb'), 'w', encoding='utf8', newline='\n') as f:
        json.dump(d, f, ensure_ascii=False, indent=2)
        f.write('\n')

# ---------------------------------------------------------------- language names
def load(name):
    p = os.path.join(CLDR, name + '.json')
    return json.load(open(p, encoding='utf8')) if os.path.exists(p) else None


# Filipino / Cantonese are missing in the package data (tl is used for fil).
FIL = {'en': 'Filipino', 'de': 'Filipino', 'fr': 'filipino', 'es': 'filipino', 'it': 'filippino',
       'pt': 'filipino', 'nl': 'Filipijns', 'ru': 'филиппинский', 'uk': 'філіппінська',
       'pl': 'filipiński', 'cs': 'filipínština', 'ja': 'フィリピノ語', 'ko': '필리핀어',
       'zh': '菲律宾语', 'zh_Hant': '菲律賓語', 'yue': '菲律賓語', 'vi': 'Tiếng Philippines',
       'th': 'ฟิลิปปินส์', 'id': 'Filipino', 'ms': 'Filipina', 'fil': 'Filipino',
       'ar': 'الفلبينية', 'fa': 'فیلیپینی', 'ur': 'فلپائنی', 'he': 'פיליפינית',
       'hi': 'फ़िलिपीनो', 'bn': 'ফিলিপিনো', 'ta': 'ஃபிலிபினோ', 'te': 'ఫిలిపినో',
       'tr': 'Filipince', 'gu': 'ફિલિપિનો', 'mr': 'फिलिपिनो', 'km': 'ហ្វីលីពីន',
       'my': 'ဖိလစ်ပိုင်', 'kk': 'филиппин', 'mn': 'филиппин'}
YUE = {'en': 'Cantonese', 'de': 'Kantonesisch', 'fr': 'cantonais', 'es': 'cantonés',
       'it': 'cantonese', 'pt': 'cantonês', 'nl': 'Kantonees', 'ru': 'кантонский',
       'uk': 'кантонська', 'pl': 'kantoński', 'cs': 'kantonština', 'ja': '広東語',
       'ko': '광둥어', 'zh': '粤语', 'zh_Hant': '粵語', 'yue': '粵語', 'vi': 'Tiếng Quảng Đông',
       'th': 'กวางตุ้ง', 'id': 'Kanton', 'ms': 'Kantonis', 'fil': 'Cantonese',
       'ar': 'الكانتونية', 'fa': 'کانتونی', 'ur': 'کینٹونیز', 'he': 'קנטונזית',
       'hi': 'कैंटोनीज़', 'bn': 'ক্যান্টোনিজ', 'ta': 'காண்டோனீஸ்', 'te': 'కాంటనీస్',
       'tr': 'Kantonca', 'gu': 'કેંટોનીઝ', 'mr': 'कँटोनीज', 'km': 'កន្តាំង',
       'my': 'ကန်တုံ', 'kk': 'кантон', 'mn': 'кантон', 'bo': 'ཀྵང་ཏུང་སྐད།',
       'ug': 'كانتونچە'}

names = {}
for ui in LANG_CODES:
    uloc = arb_locale(ui)
    data = load({'fil': 'tl', 'yue': 'zh_Hant'}.get(uloc, uloc)) or load('en')
    row = {}
    for code in LANG_CODES:
        k = arb_locale(code)
        if k == 'fil':
            row[code] = FIL.get(uloc) or data.get('tl') or 'Filipino'
        elif k == 'yue':
            row[code] = YUE.get(uloc) or 'Cantonese'
        else:
            row[code] = data.get(k) or load('en')[k]
    names[ui] = row

out = ['// GENERATED by tool/gen_l10n.py - do not edit by hand.',
       '// Language names (CLDR) of every translation language in every UI language.',
       '',
       'const Map<String, Map<String, String>> kLanguageNames = {']
for ui, row in names.items():
    out.append(f"  '{ui}': {{")
    for code, n in row.items():
        out.append(f"    '{code}': {json.dumps(n, ensure_ascii=False)},".replace("$", "\\$"))
    out.append('  },')
out.append('};')
with open(os.path.join(ROOT, 'lib', 'core', 'languages', 'language_names.g.dart'), 'w',
          encoding='utf8', newline='\n') as f:
    f.write('\n'.join(out) + '\n')

print('ok:', len(blocks), 'UI locales,', len(keys), 'keys')
print({c: names['en'][c] for c in ('zh-Hant', 'fil', 'yue', 'ug', 'bo')})
print({c: names['ja'][c] for c in ('zh-Hant', 'fil', 'yue', 'ug', 'en')})
