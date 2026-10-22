import io, re, shutil
from PIL import Image
from resvg_py import svg_to_bytes
B=r'C:\Users\asus\Desktop\projeler\translate\Mobil'
src=open(B+r'\hy_translate\branding\atoll_icon.svg',encoding='utf8').read()
defs=re.search(r'<defs>.*?</defs>',src,re.S).group(0)
body=re.search(r'</defs>\s*(.*)</svg>',src,re.S).group(1)  # rect + mark
word='''<g fill="none" stroke="#F2FFFD" stroke-width="26" stroke-linecap="round" stroke-linejoin="round">
<path d="M13 177 L88 13 L163 177 M46 125 H130"/><path d="M215 50 V140 Q215 177 252 177 M190 78 H252"/>
<circle cx="345" cy="120" r="57"/><path d="M455 13 V177 M520 13 V177"/></g>'''
def fg(tag,out):
    s=f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 500">{defs}
<defs><radialGradient id="glow" cx="50%" cy="50%" r="50%"><stop offset="0" stop-color="#2FD0C8" stop-opacity=".28"/><stop offset="1" stop-color="#2FD0C8" stop-opacity="0"/></radialGradient>
<linearGradient id="bgf" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#0D2A4F"/><stop offset=".6" stop-color="#081A33"/><stop offset="1" stop-color="#050E1C"/></linearGradient>
<clipPath id="tile"><rect width="1024" height="1024" rx="224"/></clipPath></defs>
<rect width="1024" height="500" fill="url(#bgf)"/>
<ellipse cx="215" cy="250" rx="330" ry="330" fill="url(#glow)"/>
<g fill="none" stroke="#2FD0C8" stroke-opacity=".10" stroke-width="2"><circle cx="880" cy="250" r="150"/><circle cx="880" cy="250" r="230"/><circle cx="880" cy="250" r="320"/></g>
<g fill="none" stroke="#5CF2E0" stroke-opacity=".22" stroke-width="10" stroke-linecap="round"><path d="M1035 130 A300 300 0 0 0 800 470"/></g>
<g transform="translate(85 125) scale(.25)"><g clip-path="url(#tile)">{body}</g></g>
<g transform="translate(395 118) scale(.68)">{word}</g>
<text x="397" y="305" font-family="Segoe UI" font-weight="600" font-size="31" fill="#BFEFEA">{tag}</text>
<rect x="397" y="330" width="64" height="4" rx="2" fill="#5CF2E0"/>
</svg>'''
    b=svg_to_bytes(svg_string=s,width=1024,height=500,font_dirs=[r'C:\Windows\Fonts'],background='#06101F')
    im=Image.open(io.BytesIO(bytes(b))).convert('RGB'); im.save(out); print(out,im.size,im.mode)
G=B+r'\store_listing\graphics'
fg('Translate anywhere. No internet needed.',G+r'\feature_graphic.png')
fg('Her yerde çevir. İnternet gerekmez.',G+r'\feature_graphic_tr.png')
im=Image.open(B+r'\hy_translate\branding\atoll_icon_512.png').convert('RGBA'); im.save(G+r'\icon_512.png'); print(im.size,im.mode)
