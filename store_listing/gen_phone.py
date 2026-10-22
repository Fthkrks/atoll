import io, base64, os, sys
from PIL import Image
from resvg_py import svg_to_bytes
B=r'C:\Users\asus\Desktop\projeler\translate\Mobil\store_listing'
# crop height (px of the 1080x2400 raw capture) per slot
crop={4:2000}
fs={3:50}
CAPTIONS={
 'en':[('Works in airplane mode','Translate offline, anywhere'),
       ('Your words stay on your phone','No cloud. No account. Private.'),
       ('Translate documents, keep the layout','DOCX, PPTX, XLSX, PDF and more'),
       ('One on-device AI model','Downloaded once, works offline')],
 'tr':[('İnternetsiz çalışır','Çevrimdışı çeviri, her yerde'),
       ('Metinleriniz telefonunuzda kalır','Bulut yok. Hesap yok. Gizli.'),
       ('Belgeleri çevirin, düzeni koruyun','DOCX, PPTX, XLSX, PDF ve daha fazlası'),
       ('Cihaz üzerinde yapay zeka','Bir kez indirin, internetsiz çalışır')],
}
W,H=1080,1920; sw=684; sx=(W-sw)//2; sy=360
def esc(t): return t.replace('&','&amp;').replace('<','&lt;')
for lang in ('en','tr'):
    os.makedirs(f'{B}\graphics\{lang}',exist_ok=True)
    for i,(cap,sub) in enumerate(CAPTIONS[lang],1):
        im0=Image.open(f'{B}\screenshots\{lang}_raw_{i:02d}.png').convert('RGB'); ch=crop.get(i,2400)
        im0=im0.crop((0,0,1080,ch)); bio=io.BytesIO(); im0.save(bio,'PNG'); d=base64.b64encode(bio.getvalue()).decode()
        sh=round(sw*ch/1080)
        s=f'''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 {W} {H}">
<defs><linearGradient id="bg" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#0D2A4F"/><stop offset="1" stop-color="#050E1C"/></linearGradient>
<radialGradient id="g" cx="50%" cy="50%" r="50%"><stop offset="0" stop-color="#2FD0C8" stop-opacity=".30"/><stop offset="1" stop-color="#2FD0C8" stop-opacity="0"/></radialGradient>
<clipPath id="c"><rect x="{sx}" y="{sy}" width="{sw}" height="{sh}" rx="44"/></clipPath></defs>
<rect width="{W}" height="{H}" fill="url(#bg)"/>
<ellipse cx="540" cy="1100" rx="620" ry="700" fill="url(#g)"/>
<g fill="none" stroke="#5CF2E0" stroke-opacity=".12" stroke-width="3"><circle cx="1000" cy="200" r="260"/><circle cx="1000" cy="200" r="380"/></g>
<text x="540" y="168" text-anchor="middle" font-family="Segoe UI" font-weight="700" font-size="{fs.get(i,62)}" fill="#F2FFFD">{esc(cap)}</text>
<text x="540" y="244" text-anchor="middle" font-family="Segoe UI" font-weight="400" font-size="36" fill="#9FE8E0">{esc(sub)}</text>
<rect x="{sx-10}" y="{sy-10}" width="{sw+20}" height="{sh+20}" rx="54" fill="#0B1B33" stroke="#5CF2E0" stroke-opacity=".55" stroke-width="3"/>
<image x="{sx}" y="{sy}" width="{sw}" height="{sh}" preserveAspectRatio="xMidYMid slice" clip-path="url(#c)" xlink:href="data:image/png;base64,{d}"/>
</svg>'''
        b=svg_to_bytes(svg_string=s,width=W,height=H,font_dirs=[r'C:\Windows\Fonts'],background='#050E1C')
        im=Image.open(io.BytesIO(bytes(b))).convert('RGB'); out=os.path.join(B,'graphics',lang,f'phone_{i:02d}.png'); im.save(out); print(out,im.size)
