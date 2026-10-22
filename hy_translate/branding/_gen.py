import math, os, sys
from resvg_py import svg_to_bytes
D=os.path.dirname(os.path.abspath(__file__))
R=355; SW=50
def pt(a): return (512+R*math.cos(math.radians(a)), 512-R*math.sin(math.radians(a)))
s=pt(54); e=pt(36)
ring=f'M{s[0]:.1f} {s[1]:.1f} A{R} {R} 0 1 0 {e[0]:.1f} {e[1]:.1f}'
DEFS='''<defs>
<radialGradient id="bg" cx="50%" cy="42%" r="75%"><stop offset="0" stop-color="#12315A"/><stop offset="1" stop-color="#071326"/></radialGradient>
<linearGradient id="reef" x1="140" y1="900" x2="880" y2="130" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#0E9AA7"/><stop offset="1" stop-color="#5CF2E0"/></linearGradient>
<radialGradient id="lagoon" cx="50%" cy="50%" r="50%"><stop offset="0" stop-color="#2FD0C8" stop-opacity=".30"/><stop offset="1" stop-color="#0E9AA7" stop-opacity=".06"/></radialGradient>
</defs>'''
def mark(scale=1.0):
    t=f' transform="translate(512 512) scale({scale}) translate(-512 -512)"' if scale!=1 else ''
    return f'''<g{t}>
<circle cx="512" cy="512" r="{R-SW/2+4}" fill="url(#lagoon)"/>
<path d="{ring}" fill="none" stroke="url(#reef)" stroke-width="{SW}" stroke-linecap="round"/>
<g fill="none" stroke="#F2FFFD" stroke-width="30" stroke-linecap="round" stroke-linejoin="round">
<path d="M262 626 L352 398 L442 626 M292 556 H412"/>
<path d="M582 478 H762 M672 428 V478 M634 506 L752 624 M714 506 L592 624" stroke-width="28"/>
</g>
<g fill="none" stroke="#5CF2E0" stroke-width="16" stroke-linecap="round" stroke-linejoin="round">
<path d="M468 484 H556 M534 462 L556 484 L534 506"/>
<path d="M556 560 H468 M490 538 L468 560 L490 582"/>
</g>
</g>'''
def svg(body,vb="0 0 1024 1024",w=None):
    return f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="{vb}"'+(f' width="{w[0]}" height="{w[1]}"' if w else '')+f'>\n{DEFS}\n{body}\n</svg>\n'
icon=svg('<rect width="1024" height="1024" fill="url(#bg)"/>\n'+mark())
legacy=svg('<rect width="1024" height="1024" rx="224" fill="url(#bg)"/>\n'+mark())
fg=svg(mark(0.86))
def word(color):
    return f'''<g fill="none" stroke="{color}" stroke-width="26" stroke-linecap="round" stroke-linejoin="round">
<path d="M13 177 L88 13 L163 177 M46 125 H130"/>
<path d="M215 50 V140 Q215 177 252 177 M190 78 H252"/>
<circle cx="345" cy="120" r="57"/>
<path d="M455 13 V177 M520 13 V177"/></g>'''
def horiz(color):
    return svg(f'<g transform="translate(40 40) scale(.273)"><rect width="1024" height="1024" rx="224" fill="url(#bg)"/>{mark()}</g>\n<g transform="translate(400 85) scale(1.15)">{word(color)}</g>',vb="0 0 1080 360")
files={'atoll_icon.svg':icon,'atoll_foreground.svg':fg,'atoll_logo_horizontal.svg':horiz('#0A1F3D'),'atoll_logo_horizontal_dark.svg':horiz('#F2FFFD')}
for n,c in files.items(): open(os.path.join(D,n),'w',encoding='utf8').write(c)
def png(sv,path,w,h=None,bg=None):
    b=svg_to_bytes(svg_string=sv,width=w,height=h or w,background=bg)
    open(path,'wb').write(bytes(b))
for n in (1024,512,192,48): png(icon,f'{D}/atoll_icon_{n}.png',n)
png(horiz('#0A1F3D'),f'{D}/atoll_logo_horizontal_1200.png',1200,400,'#FFFFFF')
png(horiz('#F2FFFD'),f'{D}/atoll_logo_horizontal_dark_1200.png',1200,400,'#06101F')
RES=os.path.join(D,'..','android','app','src','main','res')
for d,l,f in (('mdpi',48,108),('hdpi',72,162),('xhdpi',96,216),('xxhdpi',144,324),('xxxhdpi',192,432)):
    png(legacy,f'{RES}/mipmap-{d}/ic_launcher.png',l)
    png(fg,f'{RES}/mipmap-{d}/ic_launcher_foreground.png',f)
