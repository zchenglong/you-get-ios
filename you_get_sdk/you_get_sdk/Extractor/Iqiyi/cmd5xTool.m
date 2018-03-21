//
// Created by 吴斯奇 on 2018/2/6.
// Copyright (c) 2018 Charlie.Z. All rights reserved.
//

#import "cmd5xTool.h"


@implementation cmd5xTool {

}

+ (NSString *) cmd5x: (NSString *) b {
    uint8_t temp[16 * 1024]={0};
    int     pt   = 321 * 16;
    int32_t * Rp = (int32_t *) & temp;
    uint8_t * Rq = (uint8_t *) & temp;
    int8_t *  a  = (int8_t *) & temp;
    int32_t * c  = (int32_t *) & temp;
    Rp[0] = 255;
    int i = 1760;
//        int m = 0;
//        int n = 0;
//        int o = 0;
//        int p = 0;
//        int s = 0;
//        int t = 0;
//        int u = 0;
//        int v = 0;
//        int w = 0;
//        int x = 0;
//        int y = 0;
//        int z = 0;
//        int A = 0;
//        int B = 0;
//        int C = 0;
//        int D = 0;
//        int E = 0;
//        int F = 0;
//        int G = 0;
//        int H = 0;
//        int I = 0;
//        int J = 0;
//        int K = 0;
    // var L = Math.floor;
    // var M = Math.abs;
    // let Z = Math.imul;
    // var _ = Math.min;
//        int ua = 0;
    int ut = 0;
    for (int ui = 0; ui < b.length; ++ui) {
        unichar uLocal = [b characterAtIndex:ui];
        if (uLocal >= 55296 && uLocal <= 57343)
            uLocal = 65536 + ((uLocal & 1023) << 10) | [b characterAtIndex:++ui] & 1023;
        if (uLocal <= 127) {
            ++ut;
        } else if (uLocal <= 2047) {
            ut += 2;
        } else if (uLocal <= 65535) {
            ut += 3;
        } else if (uLocal <= 2097151) {
            ut += 4;
        } else if (uLocal <= 67108863) {
            ut += 5;
        } else {
            ut += 6;
        }
    }
    unichar ps[ut + 1];
    int po = 0, pn = 0;
    Rp[51] = 3920;
    Rp[54] = 8328;
    int pm = pn + ut;
    for (int ui = 0; ui < b.length; ++ui) {
        unichar uLocal = [b characterAtIndex:ui];
        if (uLocal >= 55296 && uLocal <= 57343)
            uLocal = (unichar) (65536 + ((uLocal & 1023) << 10) | [b characterAtIndex:++ui] & 1023);
        if (uLocal <= 127) {
            if (pn >= pm)
                break;
            ps[pn++] = uLocal;
        } else if (uLocal <= 2047) {
            if (pn + 1 >= pm)
                break;
            ps[pn++] = (unichar) (192 | uLocal >> 6);
            ps[pn++] = (unichar) (128 | uLocal & 63);
        } else if (uLocal <= 65535) {
            if (pn + 2 >= pm)
                break;
            ps[pn++] = (unichar) (224 | uLocal >> 12);
            ps[pn++] = (unichar) (128 | uLocal >> 6 & 63);
            ps[pn++] = (unichar) (128 | uLocal & 63);
        } else if (uLocal <= 2097151) {
            if (pn + 3 >= pm)
                break;
            ps[pn++] = (unichar) (240 | uLocal >> 18);
            ps[pn++] = (unichar) (128 | uLocal >> 12 & 63);
            ps[pn++] = (unichar) (128 | uLocal >> 6 & 63);
            ps[pn++] = (unichar) (128 | uLocal & 63);
        } else if (uLocal <= 67108863) {
            if (pn + 4 >= pm)
                break;
            ps[pn++] = (unichar) (248 | uLocal >> 24);
            ps[pn++] = (unichar) (128 | uLocal >> 18 & 63);
            ps[pn++] = (unichar) (128 | uLocal >> 12 & 63);
            ps[pn++] = (unichar) (128 | uLocal >> 6 & 63);
            ps[pn++] = (unichar) (128 | uLocal & 63);
        } else {
            if (pn + 5 >= pm)
                break;
            ps[pn++] = (unichar) (252 | uLocal >> 30);
            ps[pn++] = (unichar) (128 | uLocal >> 24 & 63);
            ps[pn++] = (unichar) (128 | uLocal >> 18 & 63);
            ps[pn++] = (unichar) (128 | uLocal >> 12 & 63);
            ps[pn++] = (unichar) (128 | uLocal >> 6 & 63);
            ps[pn++] = (unichar) (128 | uLocal & 63);
        }
    }
    ps[pn] = 0;
    for (int index = 0; index < ((sizeof ps) / (sizeof ps[0])); index ++) {
        Rq[index + pt] = (uint8_t)(ps[index] & 0xff);
    }
    b = [NSString stringWithFormat:@"%d", pt];
    int
            d,
            e,
            f,
            g,
            h,
            j,
            k,
            l,
            m,
            n,
            o,
            p,
            q,
            r,
            s,
            t,
            u,
            v,
            w,
            x,
            y,
            z,
            A,
            B,
            C,
            D,
            E,
            F,
            G,
            H,
            I,
            J,
            K,
            L,
            M,
            N,
            O,
            P,
            Q,
            R,
            S,
            T,
            U,
            V,
            W,
            X,
            Y,
            _,
            $,
            aa,
            ba,
            ca,
            da,
            ea,
            fa,
            ga,
            ha,
            ia,
            ja,
            ka,
            la,
            ma,
            na,
            oa,
            pa,
            qa,
            ra,
            sa,
            ta,
            ua,
            va,
            wa,
            xa,
            ya,
            za,
            Aa,
            Ba,
            Ca,
            Da,
            Ea,
            Fa,
            Ga,
            Ha,
            Ia,
            Ja,
            Ka,
            La,
            Ma = 0,
            Na,
            Oa,
            Pa,
            Qa,
            Ra,
            Sa,
            Ua,
            Va,
            Wa,
            Xa,
            Ya,
            Za,
            _a,
            $a,
            ab,
            bb,
            cb,
            db,
            eb,
            fb,
            gb,
            hb,
            ib,
            jb,
            kb,
            lb,
            mb,
            nb,
            ob,
            pb,
            qb;
    Na = i;
    i = i + 304;
    Aa = Na + 40;
    La = Na;
    h = Aa + 4;
    j = Aa + 8;
    u = Aa + 12;
    F = Aa + 16;
    Q = Aa + 20;
    aa = Aa + 24;
    la = Aa + 28;
    pa = Aa + 32;
    qa = Aa + 36;
    ra = Aa + 40;
    k = Aa + 44;
    l = Aa + 48;
    m = Aa + 52;
    n = Aa + 56;
    o = Aa + 60;
    p = Aa + 64;
    q = Aa + 68;
    r = Aa + 72;
    s = Aa + 76;
    t = Aa + 80;
    v = Aa + 84;
    w = Aa + 88;
    x = Aa + 92;
    y = Aa + 96;
    z = Aa + 100;
    A = Aa + 104;
    B = Aa + 108;
    C = Aa + 112;
    D = Aa + 116;
    E = Aa + 120;
    G = Aa + 124;
    H = Aa + 128;
    I = Aa + 132;
    J = Aa + 136;
    K = Aa + 140;
    L = Aa + 144;
    M = Aa + 148;
    N = Aa + 152;
    O = Aa + 156;
    P = Aa + 160;
    R = Aa + 164;
    S = Aa + 168;
    T = Aa + 172;
    U = Aa + 176;
    V = Aa + 180;
    W = Aa + 184;
    X = Aa + 188;
    Y = Aa + 192;
    _ = Aa + 196;
    $ = Aa + 200;
    ba = Aa + 204;
    ca = Aa + 208;
    da = Aa + 212;
    ea = Aa + 216;
    fa = Aa + 220;
    ga = Aa + 224;
    ha = Aa + 228;
    ia = Aa + 232;
    ja = Aa + 236;
    ka = Aa + 240;
    ma = Aa + 244;
    na = Aa + 248;
    oa = Aa + 252;
    f = 78;
    sa = 0;
    ta = 0;
    ua = 0;
    va = 0;
    wa = 0;
    xa = 0;
    ya = 0;
    za = 0;
    Ba = 0;
    Ca = 0;
    Da = 0;
    Ea = 0;
    Fa = 0;
    e = 0;
    d = 0;
    Ga = 0;
    Ha = 0;
    Ia = 0;
    Ja = 0;
    Ka = 0;
    b:
    while (true) {
        switch (f) {
            case 62:
                goto a;
            case 145:
            {
                Ma = 136;
                goto a;
            }case 112:
            {
                eb = Ka;
                db = Ja;
                cb = Ia;
                bb = Ha;
                ab = Ga;
                $a = d;
                _a = e;
                Za = Fa;
                Ya = Ea;
                Xa = Da;
                Wa = Ca;
                Va = Ba;
                Ua = za;
                Sa = ya;
                Ra = wa;
                Qa = va;
                Pa = ua;
                Oa = ta;
                g = sa;
                f = 99;
                xa = c[La + (Ia + 1588902052 + -1 + -1588902052 + -1250383377 - sa + 1250383377 << 2) >> 2];
                Ka = eb;
                Ja = db;
                Ia = cb;
                Ha = bb;
                Ga = ab;
                d = $a;
                e = _a;
                Fa = Za;
                Ea = Ya;
                Da = Xa;
                Ca = Wa;
                Ba = Va;
                za = Ua;
                ya = Sa;
                wa = Ra;
                va = Qa;
                ua = Pa;
                ta = Oa;
                sa = g;
                goto b;
            }case 111:
            {
                fb = Ka;
                g = Ja;
                Oa = Ia;
                Pa = Ha;
                Qa = Ga;
                Ra = d;
                Sa = e;
                Ua = Fa;
                Va = Ea;
                Wa = Da;
                Xa = Ca;
                Ya = Ba;
                Za = za;
                _a = ya;
                $a = xa;
                ab = wa;
                bb = va;
                cb = ua;
                db = ta;
                eb = sa;
                f = (Ia) == (sa) ? 110 : 107;
                Ka = fb;
                Ja = g;
                Ia = Oa;
                Ha = Pa;
                Ga = Qa;
                d = Ra;
                e = Sa;
                Fa = Ua;
                Ea = Va;
                Da = Wa;
                Ca = Xa;
                Ba = Ya;
                za = Za;
                ya = _a;
                xa = $a;
                wa = ab;
                va = bb;
                ua = cb;
                ta = db;
                sa = eb;
                goto b;
            }case 110:
            {
                g = Ka;
                Oa = Ja;
                Pa = Ia;
                Qa = Ha;
                Ra = Ga;
                Sa = d;
                Ua = e;
                Va = Fa;
                Wa = Ea;
                Xa = Da;
                Ya = Ca;
                Za = Ba;
                _a = za;
                $a = ya;
                ab = xa;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = (e) > 0 ? 109 : 107;
                Ka = g;
                Ja = Oa;
                Ia = Pa;
                Ha = Qa;
                Ga = Ra;
                d = Sa;
                e = Ua;
                Fa = Va;
                Ea = Wa;
                Da = Xa;
                Ca = Ya;
                Ba = Za;
                za = _a;
                ya = $a;
                xa = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 109:
            {
                Oa = Ka;
                Pa = Ja;
                Qa = Ia;
                Ra = Ha;
                Sa = Ga;
                Ua = d;
                Va = e;
                Wa = Fa;
                Xa = Ea;
                Ya = Da;
                Za = Ca;
                _a = Ba;
                $a = za;
                ab = ya;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = 99;
                xa = c[La >> 2];
                Ka = Oa;
                Ja = Pa;
                Ia = Qa;
                Ha = Ra;
                Ga = Sa;
                d = Ua;
                e = Va;
                Fa = Wa;
                Ea = Xa;
                Da = Ya;
                Ca = Za;
                Ba = _a;
                za = $a;
                ya = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 107:
            {
                g = Ka;
                Oa = Ja;
                Pa = Ia;
                Qa = Ha;
                Ra = Ga;
                Sa = d;
                Ua = e;
                Va = Fa;
                Wa = Ea;
                Xa = Da;
                Ya = Ca;
                Za = Ba;
                _a = za;
                $a = ya;
                ab = xa;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = (Ia) > (sa - 1017329338 + 1 + 1017329338) ? 106 : 105;
                Ka = g;
                Ja = Oa;
                Ia = Pa;
                Ha = Qa;
                Ga = Ra;
                d = Sa;
                e = Ua;
                Fa = Va;
                Ea = Wa;
                Da = Xa;
                Ca = Ya;
                Ba = Za;
                za = _a;
                ya = $a;
                xa = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 106:
            {
                Oa = Ka;
                Pa = Ja;
                Qa = Ia;
                Ra = Ha;
                Sa = Ga;
                Ua = d;
                Va = e;
                Wa = Fa;
                Xa = Ea;
                Ya = Da;
                Za = Ca;
                _a = Ba;
                $a = za;
                ab = ya;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = 99;
                xa = 0;
                Ka = Oa;
                Ja = Pa;
                Ia = Qa;
                Ha = Ra;
                Ga = Sa;
                d = Ua;
                e = Va;
                Fa = Wa;
                Ea = Xa;
                Da = Ya;
                Ca = Za;
                Ba = _a;
                za = $a;
                ya = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 105:
            {
                Oa = Ka;
                Pa = Ja;
                Qa = Ia;
                Ra = Ha;
                Sa = Ga;
                Ua = d;
                Va = e;
                Wa = Fa;
                Xa = Ea;
                Ya = Da;
                Za = Ca;
                _a = Ba;
                $a = za;
                ab = ya;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = 99;
                xa = c[Ka + (Ia << 2) >> 2];
                Ka = Oa;
                Ja = Pa;
                Ia = Qa;
                Ha = Ra;
                Ga = Sa;
                d = Ua;
                e = Va;
                Fa = Wa;
                Ea = Xa;
                Da = Ya;
                Ca = Za;
                Ba = _a;
                za = $a;
                ya = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 104:
            {
                f = Ba - 520486856 + 40 + 520486856 >> 6 << 4;
                g = Ka;
                Oa = Ja;
                Pa = Ia;
                Qa = Ha;
                Ra = Ga;
                Sa = d;
                Ua = e;
                Va = Fa;
                Wa = Ea;
                Xa = Da;
                Ya = Ca;
                Za = Ba;
                _a = za;
                $a = ya;
                ab = xa;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = (Ia) == (f & 14 | f ^ 14) ? 103 : 102;
                Ka = g;
                Ja = Oa;
                Ia = Pa;
                Ha = Qa;
                Ga = Ra;
                d = Sa;
                e = Ua;
                Fa = Va;
                Ea = Wa;
                Da = Xa;
                Ca = Ya;
                Ba = Za;
                za = _a;
                ya = $a;
                xa = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 103:
            {
                Oa = Ka;
                Pa = Ja;
                Qa = Ia;
                Ra = Ha;
                Sa = Ga;
                Ua = d;
                Va = e;
                Wa = Fa;
                Xa = Ea;
                Ya = Da;
                Za = Ca;
                _a = Ba;
                $a = za;
                ab = ya;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = 99;
                xa = (Ba << 3) + -906020365 + 256 + 906020365;
                Ka = Oa;
                Ja = Pa;
                Ia = Qa;
                Ha = Ra;
                Ga = Sa;
                d = Ua;
                e = Va;
                Fa = Wa;
                Ea = Xa;
                Da = Ya;
                Ca = Za;
                Ba = _a;
                za = $a;
                ya = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 102:
            {
                g = Ka;
                Oa = Ja;
                Pa = Ia;
                Qa = Ha;
                Ra = Ga;
                Sa = d;
                Ua = e;
                Va = Fa;
                Wa = Ea;
                Xa = Da;
                Ya = Ca;
                Za = Ba;
                _a = za;
                $a = ya;
                ab = xa;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = (Ia) > (sa - 2136007327 + 1 + 2136007327) ? 101 : 100;
                Ka = g;
                Ja = Oa;
                Ia = Pa;
                Ha = Qa;
                Ga = Ra;
                d = Sa;
                e = Ua;
                Fa = Va;
                Ea = Wa;
                Da = Xa;
                Ca = Ya;
                Ba = Za;
                za = _a;
                ya = $a;
                xa = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 101:
            {
                Oa = Ka;
                Pa = Ja;
                Qa = Ia;
                Ra = Ha;
                Sa = Ga;
                Ua = d;
                Va = e;
                Wa = Fa;
                Xa = Ea;
                Ya = Da;
                Za = Ca;
                _a = Ba;
                $a = za;
                ab = ya;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = 99;
                xa = 0;
                Ka = Oa;
                Ja = Pa;
                Ia = Qa;
                Ha = Ra;
                Ga = Sa;
                d = Ua;
                e = Va;
                Fa = Wa;
                Ea = Xa;
                Da = Ya;
                Ca = Za;
                Ba = _a;
                za = $a;
                ya = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 100:
            {
                Oa = Ka;
                Pa = Ja;
                Qa = Ia;
                Ra = Ha;
                Sa = Ga;
                Ua = d;
                Va = e;
                Wa = Fa;
                Xa = Ea;
                Ya = Da;
                Za = Ca;
                _a = Ba;
                $a = za;
                ab = ya;
                bb = wa;
                cb = va;
                db = ua;
                eb = ta;
                fb = sa;
                f = 99;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = Oa;
                Ja = Pa;
                Ia = Qa;
                Ha = Ra;
                Ga = Sa;
                d = Ua;
                e = Va;
                Fa = Wa;
                Ea = Xa;
                Da = Ya;
                Ca = Za;
                Ba = _a;
                za = $a;
                ya = ab;
                wa = bb;
                va = cb;
                ua = db;
                ta = eb;
                sa = fb;
                goto b;
            }case 99:
            {
                sa = c[Aa + (za << 2) >> 2];
                Ga = ~(~(((sa ^ ~-2) & sa) - (0 - xa)) | ~-2) & (~-1024496191 | -1024496191);
                Pa = (sa ^ ~1) & sa;
                Oa = ~Ga;
                Qa = ~Pa;
                Ia = ~-1404706964;
                Ia = ((Oa & -1404706964 | Ga & Ia) ^ (Qa & -1404706964 | Pa & Ia) | ~(Oa | Qa) & (-1404706964 | Ia)) - (0 - ((xa ^ ~1) & xa)) | 0;
                Qa = ~(~(0 - (0 - Ia + (0 - ((Ha ^ ~-2) & Ha)))) | ~-2) & (2145560826 | ~2145560826);
                Oa = (Ha ^ ~1) & Ha;
                Pa = ~Qa;
                Ga = ~Oa;
                Ua = ~-405859795;
                sa = 0 - (0 - ((Pa & -405859795 | Qa & Ua) ^ (Ga & -405859795 | Oa & Ua) | ~(Pa | Ga) & (-405859795 | Ua)) + (0 - (~(~(sa + 125479053 + xa - 125479053) | ~1) & (566281542 | ~566281542)))) | 0;
                Ua = (za | 0) % 4 | 0;
                Ua = 0 - (0 - (Ua << 2) + (0 - 1639813410)) - 1628865018 + ((((Ua + -946902778 + -1 + 946902778 | 0) * Ua) | 0) / 2 | 0) + 1628865018 | 0;
                Ga = Ua + -705355747 + -1639813405 + 705355747 | 0;
                Pa = sa << Ga;
                Ua = (uint)(sa & 0xffffffff) >> (1639813437 + -1775524201 - Ua + 1775524201 | 0);
                Ua = Pa & Ua | Pa ^ Ua;
                Pa = (ua ^ ~1) & ua;
                Oa = 0 - (0 - ua + (0 - 1859242102)) | 0;
                Oa = ~(~(((Oa ^ ~-2) & Oa) + 403699684 + Ua + -403699684) | ~-2) & (~-221245562 | -221245562);
                Qa = ~Oa;
                Ra = ~Pa;
                Sa = ~-2075741683;
                ib = ~(~Ua | ~1) & (~-1546354233 | -1546354233);
                hb = ~ib;
                gb = ~-1859242102;
                g = ~-1973195180;
                Va = Ka;
                Wa = Ja;
                Xa = Ha;
                Ya = d;
                Za = e;
                _a = Fa;
                $a = Ea;
                ab = Da;
                bb = Ca;
                cb = Ba;
                db = ya;
                eb = va;
                fb = ua;
                ta = wa;
                f = 119;
                ua = 0 - (0 - ((hb & -1973195180 | ib & g) ^ (gb & -1973195180 | -1859242102 & g) | ~(hb | gb) & (-1973195180 | g)) + (0 - ((Qa & -2075741683 | Oa & Sa) ^ (Ra & -2075741683 | Pa & Sa) | ~(Qa | Ra) & (-2075741683 | Sa)))) | 0;
                xa = Ua;
                za = 0 - (0 - za + (0 - 1)) | 0;
                Ka = Va;
                Ja = Wa;
                Ha = Xa;
                d = Ya;
                e = Za;
                Fa = _a;
                Ea = $a;
                Da = ab;
                Ca = bb;
                Ba = cb;
                ya = db;
                wa = eb;
                va = fb;
                goto b;
            }case 97:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (za | 0) < 48 ? 95 : 63;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 95:
            {
                Qa = ua & ~va | va & ~ua;
                Ha = ~-1719848737;
                Ha = (~Qa & -1719848737 | Qa & Ha) ^ (~wa & -1719848737 | wa & Ha);
                Qa = 0 - (0 - (~(~ta | ~-2) & (573433763 | ~573433763)) + (0 - Ha)) | 0;
                Qa = (Qa ^ ~-2) & Qa;
                Ra = (ta ^ ~1) & ta;
                Sa = ~Qa;
                Ua = ~Ra;
                Ia = ~373881474;
                Va = Ka;
                Wa = Ja;
                Xa = Ga;
                Ya = d;
                Za = e;
                _a = Fa;
                $a = Ea;
                ab = Da;
                bb = Ca;
                cb = Ba;
                db = za;
                eb = ya;
                fb = wa;
                gb = va;
                hb = ua;
                ib = ta;
                f = 94;
                sa = 0 - (0 - Ba + (0 + 1)) >> 2;
                xa = Ha;
                Ha = ((Sa & 373881474 | Qa & Ia) ^ (Ua & 373881474 | Ra & Ia) | ~(Sa | Ua) & (373881474 | Ia)) - (0 - (~(~Ha | ~1) & (1970494992 | ~1970494992))) | 0;
                Ia = ((0 - (0 - (za * 3 | 0) + (0 - 5)) | 0) % 16 | 0) - 169207214 + ya + 169207214 | 0;
                Ka = Va;
                Ja = Wa;
                Ga = Xa;
                d = Ya;
                e = Za;
                Fa = _a;
                Ea = $a;
                Da = ab;
                Ca = bb;
                Ba = cb;
                za = db;
                ya = eb;
                wa = fb;
                va = gb;
                ua = hb;
                ta = ib;
                goto b;
            }case 94:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (Ba + 1934808656 + 32 - 1934808656 >> 2 | 0) ? 82 : 93;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 93:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (sa | 0) ? 92 : 89;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 92:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (e | 0) > 0 ? 91 : 90;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 91:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = c[La + (Ia + (0 - sa) << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 90:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = c[La + (Ia + 692823717 + -1 - 692823717 + 2024697286 - sa - 2024697286 << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 89:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) == (sa | 0) ? 88 : 85;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 88:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (e | 0) > 0 ? 87 : 85;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 87:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = c[La >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 85:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (0 - (0 - sa + (0 - 1)) | 0) ? 84 : 83;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 84:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 83:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 82:
            {
                g = Ba + 430907182 + 40 - 430907182 >> 6 << 4;
                Oa = ~g;
                Pa = ~14;
                f = ~-2004298390;
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) == ((Oa & -2004298390 | g & f) ^ (Pa & -2004298390 | 14 & f) | ~(Oa | Pa) & (-2004298390 | f) | 0) ? 81 : 80;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 81:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = (Ba << 3) - (0 - 256) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 80:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (0 - (0 - sa + (0 - 1)) | 0) ? 79 : 77;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 79:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 78:
            {
                c[Aa >> 2] = -680876936;
                c[h >> 2] = -389564586;
                c[j >> 2] = 606105819;
                c[u >> 2] = -1044525330;
                c[F >> 2] = -176418897;
                c[Q >> 2] = 1200080426;
                c[aa >> 2] = -1473231341;
                c[la >> 2] = -45705983;
                c[pa >> 2] = 1770035416;
                c[qa >> 2] = -1958414417;
                c[ra >> 2] = -42063;
                c[k >> 2] = -1990404162;
                c[l >> 2] = 1804603682;
                c[m >> 2] = -40341101;
                c[n >> 2] = -1502002290;
                c[o >> 2] = 1236535329;
                c[p >> 2] = -165796510;
                c[q >> 2] = -1069501632;
                c[r >> 2] = 643717713;
                c[s >> 2] = -373897302;
                c[t >> 2] = -701558691;
                c[v >> 2] = 38016083;
                c[w >> 2] = -660478335;
                c[x >> 2] = -405537848;
                c[y >> 2] = 568446438;
                c[z >> 2] = -1019803690;
                c[A >> 2] = -187363961;
                c[B >> 2] = 1163531501;
                c[C >> 2] = -1444681467;
                c[D >> 2] = -51403784;
                c[E >> 2] = 1735328473;
                c[G >> 2] = -1926607734;
                c[H >> 2] = -378558;
                c[I >> 2] = -2022574463;
                c[J >> 2] = 1839030562;
                c[K >> 2] = -35309556;
                c[L >> 2] = -1530992060;
                c[M >> 2] = 1272893353;
                c[N >> 2] = -155497632;
                c[O >> 2] = -1094730640;
                c[P >> 2] = 681279174;
                c[R >> 2] = -358537222;
                c[S >> 2] = -722521979;
                c[T >> 2] = 76029189;
                c[U >> 2] = -640364487;
                c[V >> 2] = -421815835;
                c[W >> 2] = 530742520;
                c[X >> 2] = -995338651;
                c[Y >> 2] = -198630844;
                c[_ >> 2] = 1126891415;
                c[$ >> 2] = -1416354905;
                c[ba >> 2] = -57434055;
                c[ca >> 2] = 1700485571;
                c[da >> 2] = -1894986606;
                c[ea >> 2] = -1051523;
                c[fa >> 2] = -2054922799;
                c[ga >> 2] = 1873313359;
                c[ha >> 2] = -30611744;
                c[ia >> 2] = -1560198380;
                c[ja >> 2] = 1309151649;
                c[ka >> 2] = -145523070;
                c[ma >> 2] = -1120210379;
                c[na >> 2] = 718787259;
                c[oa >> 2] = -343485551;
                $a = Ka;
                ab = Ja;
                bb = Ia;
                cb = Ha;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                f = 74;
                sa = 0;
                ta = 1732584193;
                ua = -271733879;
                va = -1732584194;
                wa = 271733878;
                xa = 1732584193;
                ya = 0;
                za = 0;
                Ba = 0;
                Ga = 1;
                Ka = $a;
                Ja = ab;
                Ia = bb;
                Ha = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                goto b;
            }case 77:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 75;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 75:
            {
                sa = c[Aa + (za << 2) >> 2] | 0;
                Ra = ~(~(((sa ^ ~-2) & sa) - (0 - xa)) | ~-2) & (1426481834 | ~1426481834);
                Qa = ~(~sa | ~1) & (171343354 | ~171343354);
                Pa = ~Ra;
                Oa = ~Qa;
                Ia = ~-268273123;
                Ia = ((Pa & -268273123 | Ra & Ia) ^ (Oa & -268273123 | Qa & Ia) | ~(Pa | Oa) & (-268273123 | Ia)) + -1134317627 + ((xa ^ ~1) & xa) + 1134317627 | 0;
                Oa = ~(~(Ia + 796911875 + (~(~Ha | ~-2) & (209274788 | ~209274788)) + -796911875) | ~-2) & (58933214 | ~58933214);
                Pa = (Ha ^ ~1) & Ha;
                Qa = ~Oa;
                Ra = ~Pa;
                Sa = ~-234558882;
                sa = sa - (0 - xa) | 0;
                Ua = Ka;
                Va = Ja;
                Wa = Ha;
                Xa = Ga;
                Ya = d;
                Za = e;
                _a = Fa;
                $a = Ea;
                ab = Da;
                bb = Ca;
                cb = Ba;
                db = za;
                eb = ya;
                fb = xa;
                gb = va;
                hb = ua;
                ib = ua;
                ta = wa;
                f = 73;
                sa = ((Qa & -234558882 | Oa & Sa) ^ (Ra & -234558882 | Pa & Sa) | ~(Qa | Ra) & (-234558882 | Sa)) + 506753693 + ((sa ^ ~1) & sa) - 506753693 | 0;
                Ka = Ua;
                Ja = Va;
                Ha = Wa;
                Ga = Xa;
                d = Ya;
                e = Za;
                Fa = _a;
                Ea = $a;
                Da = ab;
                Ca = bb;
                Ba = cb;
                za = db;
                ya = eb;
                xa = fb;
                wa = gb;
                va = hb;
                ua = ib;
                goto b;
            }case 74:
            {
                Sa = Ka;
                Ja = ya;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 72;
                ya = 0 - (0 - ya + (0 - 1)) | 0;
                Ka = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 73:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = ((za | 0) % 4 | 0 | 0) < 2 ? 71 : 69;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 72:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (a[(int)[b floatValue] + Ja >> 0] | 0) == 0 ? 66 : 68;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 71:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 67;
                Ga = 4;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 69:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 67;
                Ga = 2;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 68:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 74;
                Ba = 0 - (0 - Ba + (0 - 1)) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 67:
            {
                Ua = 0 - (0 - (((za | 0) % 4 | 0) * 7 | 0) + (0 - Ga)) | 0;
                Ra = sa << Ua;
                Sa = (uint)(sa & 0xffffffff) >> (32 + -117621929 - Ua + 117621929 | 0);
                Qa = ~Sa;
                Pa = ~Ra;
                xa = ~1172163969;
                xa = (Qa & 1172163969 | Sa & xa) ^ (Pa & 1172163969 | Ra & xa) | ~(Qa | Pa) & (1172163969 | xa);
                Pa = ~(~(0 - (0 - xa + (0 - (~(~va | ~-2) & (1283031477 | ~1283031477))))) | ~-2) & (555213856 | ~555213856);
                Qa = (va ^ ~1) & va;
                Ra = ~Pa;
                Sa = ~Qa;
                ua = ~-861084163;
                Va = Ka;
                Wa = Ja;
                Xa = Ia;
                Ya = Ha;
                Za = d;
                _a = e;
                $a = Fa;
                ab = Ea;
                bb = Da;
                cb = Ca;
                db = Ba;
                eb = ya;
                fb = wa;
                gb = va;
                hb = ta;
                ib = sa;
                f = 97;
                ua = ((Ra & -861084163 | Pa & ua) ^ (Sa & -861084163 | Qa & ua) | ~(Ra | Sa) & (-861084163 | ua)) + 1763856666 + ((xa ^ ~1) & xa) + -1763856666 | 0;
                za = za + 1402583234 + 1 - 1402583234 | 0;
                Ga = Ua;
                Ka = Va;
                Ja = Wa;
                Ia = Xa;
                Ha = Ya;
                d = Za;
                e = _a;
                Fa = $a;
                Ea = ab;
                Da = bb;
                Ca = cb;
                Ba = db;
                ya = eb;
                wa = fb;
                va = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 66:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 64;
                e = Ba >> 2;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 64:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ba | 0) < 6 ? 62 : 60;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 63:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (za | 0) < 64 ? 59 : 21;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 60:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 58;
                Ha = 0 - (0 - e + (0 - 1)) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 59:
            {
                Qa = ~wa | 0 | wa & ~-1;
                Qa = ua & Qa | ua ^ Qa;
                Qa = (Qa ^ ~(~va | 0 | va & ~-1)) & Qa;
                Ha = ~659082404;
                Ha = ~(~(~(~va | ~((659082404 & ~ua | ua & Ha) ^ (~-1 & 659082404 | -1 & Ha))) & (1735869413 | ~1735869413)) | ~wa) & (~-2123338553 | -2123338553);
                Ha = Qa & Ha | Qa ^ Ha;
                Qa = ((ta ^ ~-2) & ta) + 794469430 + Ha - 794469430 | 0;
                Qa = (Qa ^ ~-2) & Qa;
                Ra = ~(~ta | ~1) & (~-1581647320 | -1581647320);
                Sa = ~Qa;
                Ua = ~Ra;
                Ia = ~-797466866;
                Va = Ka;
                Wa = Ja;
                Xa = Ga;
                Ya = d;
                Za = e;
                _a = Fa;
                $a = Ea;
                ab = Da;
                bb = Ca;
                cb = Ba;
                db = za;
                eb = ya;
                fb = wa;
                gb = va;
                hb = ua;
                ib = ta;
                f = 57;
                sa = 0 - (0 - Ba + (0 + 1)) >> 2;
                xa = Ha;
                Ha = ((Sa & -797466866 | Qa & Ia) ^ (Ua & -797466866 | Ra & Ia) | ~(Sa | Ua) & (-797466866 | Ia)) + 394913534 + (~(~Ha | ~1) & (1642549018 | ~1642549018)) - 394913534 | 0;
                Ia = ((za * 7 | 0) % 16 | 0) - (0 - ya) | 0;
                Ka = Va;
                Ja = Wa;
                Ga = Xa;
                d = Ya;
                e = Za;
                Fa = _a;
                Ea = $a;
                Da = ab;
                Ca = bb;
                Ba = cb;
                za = db;
                ya = eb;
                wa = fb;
                va = gb;
                ua = hb;
                ta = ib;
                goto b;
            }case 58:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ha | 0) < 33 ? 56 : 54;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 57:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (Ba - 817781417 + 32 + 817781417 >> 2 | 0) ? 33 : 55;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 56:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 54;
                Ha = 33;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 55:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (sa | 0) ? 53 : 47;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 54:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ha | 0) > ((Ba - (0 - 32) >> 2) + 248548091 + 8 + -248548091 | 0) ? 50 : 52;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 53:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (e | 0) > 0 ? 51 : 49;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 52:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 50;
                Ha = 0 - (0 - (Ba - 721543188 + 32 + 721543188 >> 2) + (0 - 8)) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 51:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = c[La + (Ia - 845217744 - sa + 845217744 << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 50:
            {
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 46;
                ya = 0;
                Ka = [cmd5xTool cmd5xt:Ha << 2 c:c pt:pt] | 0;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 49:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = c[La + (Ia - (0 + 1) + 1839362061 - sa + -1839362061 << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 161:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                xa = va;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 157;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 47:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) == (sa | 0) ? 45 : 39;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 160:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) < 10 ? 158 : 156;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 46:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (ya | 0) < (Ha | 0) ? 42 : 40;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 159:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                xa = wa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 157;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 45:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (e | 0) > 0 ? 43 : 39;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 158:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 154;
                Ia = Ia - 1241365298 + 32 + 1241365298 | 0;
                Ka = Ra;
                Ja = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 157:
            {
                Pa = ~(~(za << 2) | ~28) & (1821433937 | ~1821433937);
                Qa = ~419482005;
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 155;
                xa = ~(~(xa >> ((419482005 & ~Pa | Pa & Qa) ^ (~4 & 419482005 | 4 & Qa))) | ~15) & (1118038510 | ~1118038510);
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 43:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = c[La >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 156:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 154;
                Ia = Ia - (0 - 72) | 0;
                Ka = Ra;
                Ja = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 42:
            {
                c[Ka + (ya << 2) >> 2] = 0;
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 46;
                ya = ya - 1417402377 + 1 + 1417402377 | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 155:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (xa | 0) < 10 ? 153 : 151;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 154:
            {
                Ra = za - (0 - e) | 0;
                Sa = Ia + -735801710 + 16 + 735801710 << (((Ra | 0) % 4 | 0) << 3);
                Ra = La + (Ra - (0 - (ya << 2)) >> 2 << 2) | 0;
                Ua = c[Ra >> 2] | 0;
                c[Ra >> 2] = Ua & Sa | Ua ^ Sa;
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 4;
                za = za + 744675608 + 1 - 744675608 | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 40:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 36;
                ya = 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 153:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 149;
                xa = xa - 1763841430 + 48 + 1763841430 | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 39:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (sa + -27115808 + 1 + 27115808 | 0) ? 37 : 35;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 152:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 12;
                ya = ya + 1905239980 + 1 - 1905239980 | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 151:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 149;
                xa = xa + 522724937 + 87 - 522724937 | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 37:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 150:
            {
                Wa = 128 << (((e | 0) % 4 | 0) << 3);
                Ra = La + ((ya << 2) + -395027463 + e + 395027463 >> 2 << 2) | 0;
                Xa = c[Ra >> 2] | 0;
                Va = ~Xa;
                Ua = ~Wa;
                Sa = ~503206210;
                c[Ra >> 2] = (Va & 503206210 | Xa & Sa) ^ (Ua & 503206210 | Wa & Sa) | ~(Va | Ua) & (503206210 | Sa);
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 146;
                ya = 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 36:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (ya | 0) < (Ba | 0) ? 32 : 30;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 149:
            {
                a[d + za >> 0] = (int8_t)xa;
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 15;
                za = za + -2060210203 + 1 + 2060210203 | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 35:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 147:
            {
                a[d + 32 >> 0] = 0;
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 145;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 33:
            {
                f = Ba + 1999768042 + 40 + -1999768042 >> 6 << 4;
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) == (f & 14 | f ^ 14 | 0) ? 31 : 29;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 146:
            {
                g = Ba - (0 - 40) >> 6 << 4;
                Oa = ~g;
                Pa = ~14;
                f = ~1388890711;
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (ya | 0) < ((Oa & 1388890711 | g & f) ^ (Pa & 1388890711 | 14 & f) | ~(Oa | Pa) & (1388890711 | f) | 0) ? 143 : 19;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 32:
            {
                Ua = (int) a[((int)[b floatValue] + ya >> 0)] << (((ya | 0) % 4 | 0) << 3);
                Ra = Ka + (ya >> 2 << 2) | 0;
                Sa = c[Ra >> 2] | 0;
                c[Ra >> 2] = Ua & Sa | Ua ^ Sa;
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 36;
                ya = ya - (0 - 1) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 31:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = 0 - (0 - (Ba << 3) + (0 - 256)) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 30:
            {
                e = 0 - (0 - Ba + (0 - 32)) | 0;
                f = 128 << (((e | 0) % 4 | 0) << 3);
                e = Ka + (e >> 2 << 2) | 0;
                g = c[e >> 2] | 0;
                c[e >> 2] = g & f | g ^ f;
                e = (Ba | 0) % 4 | 0;
                f = La;
                g = f + 36 | 0;
                do {
                    c[f >> 2] = 0;
                    f = f + 4 | 0;
                } while ((f | 0) < (g | 0));
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 28;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 143:
            {
                Wa = Ka;
                Xa = Ja;
                Ya = Ia;
                Za = Ha;
                _a = Ga;
                $a = d;
                ab = e;
                Fa = wa;
                Ea = va;
                Da = ua;
                Ca = ta;
                bb = Ba;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 141;
                za = 0;
                Ka = Wa;
                Ja = Xa;
                Ia = Ya;
                Ha = Za;
                Ga = _a;
                d = $a;
                e = ab;
                Ba = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 29:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (0 - (0 - sa + (0 - 1)) | 0) ? 27 : 25;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 28:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (e | 0) > 0 ? 26 : 16;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 141:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (za | 0) < 16 ? 139 : 119;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 27:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 26:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 22;
                ya = Ba + (0 - e) | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 139:
            {
                Ua = (va ^ ~ua) & va;
                Ia = ~-529461708;
                Ia = (~wa & -529461708 | wa & Ia) ^ (~ua & -529461708 | ua & Ia);
                Ia = (Ia ^ ~(~ua | 0 | ua & ~-1)) & Ia;
                Ha = ~1514409254;
                Ha = (1514409254 & ~Ia | Ia & Ha) ^ (~Ua & 1514409254 | Ua & Ha);
                Ua = 0 - (0 - (~(~ta | ~-2) & (2136387674 | ~2136387674)) + (0 - Ha)) | 0;
                Ua = (Ua ^ ~-2) & Ua;
                Ia = ~(~ta | ~1) & (583337992 | ~583337992);
                Va = Ka;
                Wa = Ja;
                Xa = Ga;
                Ya = d;
                Za = e;
                _a = Fa;
                $a = Ea;
                ab = Da;
                bb = Ca;
                cb = Ba;
                db = za;
                eb = ya;
                fb = wa;
                gb = va;
                hb = ua;
                ib = ta;
                f = 138;
                sa = Ba - 1332493879 + -1 + 1332493879 >> 2;
                xa = Ha;
                Ha = (Ua & Ia | Ua ^ Ia) + 1330564622 + (~(~Ha | ~1) & (1599288595 | ~1599288595)) - 1330564622 | 0;
                Ia = ((za | 0) % 16 | 0) - (0 - ya) | 0;
                Ka = Va;
                Ja = Wa;
                Ga = Xa;
                d = Ya;
                e = Za;
                Fa = _a;
                Ea = $a;
                Da = ab;
                Ca = bb;
                Ba = cb;
                za = db;
                ya = eb;
                wa = fb;
                va = gb;
                ua = hb;
                ta = ib;
                goto b;
            }case 25:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 23;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 138:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (Ba - (0 - 32) >> 2 | 0) ? 126 : 137;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 137:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (Ia | 0) > (sa | 0) ? 136 : 133;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 23:
            {
                sa = c[Aa + (za << 2) >> 2] | 0;
                Ga = (~(~sa | ~-2) & (~-1999460729 | -1999460729)) + 729837134 + xa + -729837134 | 0;
                Ga = (Ga ^ ~-2) & Ga;
                Ia = (sa ^ ~1) & sa;
                Ia = (Ga & Ia | Ga ^ Ia) - 1663655995 + (~(~xa | ~1) & (1797841953 | ~1797841953)) + 1663655995 | 0;
                Ga = Ia + -2098496209 + ((Ha ^ ~-2) & Ha) + 2098496209 | 0;
                Ga = (Ga ^ ~-2) & Ga;
                Ua = (Ha ^ ~1) & Ha;
                sa = (Ga & Ua | Ga ^ Ua) - (0 - (~(~(0 - (0 - sa + (0 - xa))) | ~1) & (1854390030 | ~1854390030))) | 0;
                Ua = (za | 0) % 4 | 0;
                Ua = (Ua << 2) - 23571533 + 601048392 + 23571533 - (0 - ((((0 - (0 - Ua + (0 + 1)) | 0) * Ua) | 0) / 2 | 0)) | 0;
                Ga = Ua - (0 + 601048386) | 0;
                Va = sa << Ga;
                Ua = (uint)(sa & 0xffffffff) >> (601048418 + (0 - Ua) | 0);
                Ra = ~Va;
                Sa = ~Ua;
                Xa = ~-1777071147;
                Xa = (Ra & -1777071147 | Va & Xa) ^ (Sa & -1777071147 | Ua & Xa) | ~(Ra | Sa) & (-1777071147 | Xa);
                Sa = (ua ^ ~1) & ua;
                Ra = (~(~(ua + -1742022525 + 1578590490 + 1742022525) | ~-2) & (~-66713274 | -66713274)) + -702715349 + Xa + 702715349 | 0;
                Ra = (Ra ^ ~-2) & Ra;
                Ua = ~Ra;
                Va = ~Sa;
                Wa = ~1317685325;
                g = (Xa ^ ~1) & Xa;
                Oa = ~g;
                Pa = ~-1578590490;
                Qa = ~225229394;
                Ya = Ka;
                Za = Ja;
                _a = Ha;
                $a = d;
                ab = e;
                bb = Fa;
                cb = Ea;
                db = Da;
                eb = Ca;
                fb = Ba;
                gb = ya;
                hb = va;
                ib = ua;
                ta = wa;
                f = 63;
                ua = 0 - (0 - ((Oa & 225229394 | g & Qa) ^ (Pa & 225229394 | -1578590490 & Qa) | ~(Oa | Pa) & (225229394 | Qa)) + (0 - ((Ua & 1317685325 | Ra & Wa) ^ (Va & 1317685325 | Sa & Wa) | ~(Ua | Va) & (1317685325 | Wa)))) | 0;
                xa = Xa;
                za = za + 1021816955 + 1 - 1021816955 | 0;
                Ka = Ya;
                Ja = Za;
                Ha = _a;
                d = $a;
                e = ab;
                Fa = bb;
                Ea = cb;
                Da = db;
                Ca = eb;
                Ba = fb;
                ya = gb;
                wa = hb;
                va = ib;
                goto b;
            }case 136:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (e | 0) > 0 ? 135 : 134;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 22:
            {
                Qa = Ka;
                Ra = Ja;
                Sa = Ia;
                Ua = Ha;
                Va = Ga;
                Wa = d;
                Xa = e;
                Ya = Fa;
                Za = Ea;
                _a = Da;
                $a = Ca;
                ab = Ba;
                bb = za;
                cb = ya;
                db = xa;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = (ya | 0) < (Ba | 0) ? 18 : 16;
                Ka = Qa;
                Ja = Ra;
                Ia = Sa;
                Ha = Ua;
                Ga = Va;
                d = Wa;
                e = Xa;
                Fa = Ya;
                Ea = Za;
                Da = _a;
                Ca = $a;
                Ba = ab;
                za = bb;
                ya = cb;
                xa = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 135:
            {
                Ra = Ka;
                Sa = Ja;
                Ua = Ia;
                Va = Ha;
                Wa = Ga;
                Xa = d;
                Ya = e;
                Za = Fa;
                _a = Ea;
                $a = Da;
                ab = Ca;
                bb = Ba;
                cb = za;
                db = ya;
                eb = wa;
                fb = va;
                gb = ua;
                hb = ta;
                ib = sa;
                f = 121;
                xa = c[La + (Ia + (0 - sa) << 2) >> 2] | 0;
                Ka = Ra;
                Ja = Sa;
                Ia = Ua;
                Ha = Va;
                Ga = Wa;
                d = Xa;
                e = Ya;
                Fa = Za;
                Ea = _a;
                Da = $a;
                Ca = ab;
                Ba = bb;
                za = cb;
                ya = db;
                wa = eb;
                va = fb;
                ua = gb;
                ta = hb;
                sa = ib;
                goto b;
            }case 21:
            {
                lb = (Ca ^ ~1) & Ca;
                mb = ta - (0 - 33242356) + 252947873 + ((Ca ^ ~-2) & Ca) - 252947873 | 0;
                mb = (mb ^ ~-2) & mb;
                kb = ~mb;
                jb = ~lb;
                g = ~-380726747;
                qb = ~(~ta | ~1) & (~-1162696414 | -1162696414);
                pb = ~qb;
                ob = ~-33242356;
                nb = ~-306070462;
                Ra = ((Ea ^ ~-2) & Ea) - 1609523247 + va + 1609523247 | 0;
                Ra = (Ra ^ ~-2) & Ra;
                Sa = ~(~Ea | ~1) & (1191657700 | ~1191657700);
                Ua = ~(~(((Fa ^ ~-2) & Fa) - 1778799498 + wa + 1778799498) | ~-2) & (876893045 | ~876893045);
                Va = (Fa ^ ~1) & Fa;
                Pa = ua - (0 - 924935704) + -2103109303 + ((Da ^ ~-2) & Da) + 2103109303 | 0;
                Pa = (Pa ^ ~-2) & Pa;
                Qa = (Da ^ ~1) & Da;
                Oa = (ua ^ ~1) & ua;
                Wa = Ka;
                Xa = Ja;
                Ya = Ia;
                Za = Ha;
                _a = Ga;
                $a = d;
                ab = e;
                bb = Fa;
                cb = Ea;
                db = Da;
                eb = Ca;
                fb = Ba;
                gb = za;
                hb = xa;
                ib = sa;
                f = 146;
                ta = ((pb & -306070462 | qb & nb) ^ (ob & -306070462 | -33242356 & nb) | ~(pb | ob) & (-306070462 | nb)) - (0 - ((kb & -380726747 | mb & g) ^ (jb & -380726747 | lb & g) | ~(kb | jb) & (-380726747 | g))) | 0;
                ua = (Oa & -924935704 | Oa ^ -924935704) - 937268693 + (Pa & Qa | Pa ^ Qa) + 937268693 | 0;
                va = 0 - (0 - (Ra & Sa | Ra ^ Sa) + (0 - (~(~va | ~1) & (1631560841 | ~1631560841)))) | 0;
                wa = (Ua & Va | Ua ^ Va) - (0 - ((wa ^ ~1) & wa)) | 0;
                ya = 0 - (0 - ya + (0 - 16)) | 0;
                Ka = Wa;
                Ja = Xa;
                Ia = Ya;
                Ha = Za;
                Ga = _a;
                d = $a;
                e = ab;
                Fa = bb;
                Ea = cb;
                Da = db;
                Ca = eb;
                Ba = fb;
                za = gb;
                xa = hb;
                sa = ib;
                goto b;
            }case 134:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = c[La + (Ia - 2095981013 + -1 + 2095981013 + -1028988577 - sa + 1028988577 << 2) >> 2] | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 133:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (Ia | 0) == (sa | 0) ? 132 : 129;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 19:
            {
                $a = Ka;
                ab = Ja;
                bb = Ia;
                cb = Ha;
                db = Ga;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 15;
                za = 0;
                d = [cmd5xTool cmd5xt:33 c:c pt:pt] | 0;
                Ka = $a;
                Ja = ab;
                Ia = bb;
                Ha = cb;
                Ga = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 132:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (e | 0) > 0 ? 131 : 129;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 18:
            {
                $a = a[(int)[b floatValue] + ya >> 0] << (((ya | 0) % 4 | 0) << 3);
                _a = c[La >> 2] | 0;
                c[La >> 2] = $a & _a | $a ^ _a;
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 22;
                ya = ya + -1916722598 + 1 + 1916722598 | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 131:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = c[La >> 2] | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 16:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 12;
                ya = 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 129:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (Ia | 0) > (sa + 1849332518 + 1 - 1849332518 | 0) ? 128 : 127;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 15:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (za | 0) < 32 ? 11 : 147;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 128:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 127:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 126:
            {
                f = Ba - (0 - 40) >> 6 << 4;
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (Ia | 0) == (f & 14 | f ^ 14 | 0) ? 125 : 124;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 12:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (ya | 0) < 8 ? 8 : 150;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 125:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = (Ba << 3) + 961017688 + 256 + -961017688 | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 11:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 9;
                ya = (za | 0) / 8 | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 124:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (Ia | 0) > (sa + -1509393712 + 1 + 1509393712 | 0) ? 123 : 122;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 123:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 9:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (ya | 0) == 0 ? 7 : 5;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 122:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 121;
                xa = c[Ka + (Ia << 2) >> 2] | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 8:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 4;
                za = 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 121:
            {
                Ia = c[Aa + (za << 2) >> 2] | 0;
                sa = ~(~Ia | ~1) & (1316696592 | ~1316696592);
                Ia = ~(~(0 - (0 - (0 - (0 - xa + (0 + 96809952))) + (0 - (~(~Ia | ~-2) & (~-427127086 | -427127086))))) | ~-2) & (~-1132267683 | -1132267683);
                Ga = (xa ^ ~1) & xa;
                bb = ~Ga;
                eb = ~-524507312;
                cb = ~-205119057;
                sa = 0 - (0 - ((bb & -205119057 | Ga & cb) ^ (eb & -205119057 | -524507312 & cb) | ~(bb | eb) & (-205119057 | cb)) + (0 - (Ia & sa | Ia ^ sa))) | 0;
                Ia = 0 - (0 - sa + (0 - 621317264)) | 0;
                cb = (Ha ^ ~1) & Ha;
                eb = ~(~(Ia - (0 - ((Ha ^ ~-2) & Ha))) | ~-2) & (~-128080197 | -128080197);
                bb = ~eb;
                Ga = ~cb;
                db = ~-1186168603;
                sa = ~(~(-621317265 + 1818258150 - sa - 1818258150) | ~1) & (1091295736 | ~1091295736);
                sa = ((bb & -1186168603 | eb & db) ^ (Ga & -1186168603 | cb & db) | ~(bb | Ga) & (-1186168603 | db)) - 1517567764 + (1 & ~sa | sa & ~1) + 1517567764 | 0;
                db = ((za | 0) % 4 | 0) * 5 | 0;
                Ga = db - (0 - 7) | 0;
                bb = sa << Ga;
                db = (uint)(sa & 0xffffffff) >> (25 + (0 - db) | 0);
                db = bb & db | bb ^ db;
                bb = ~(~(db + 1491303093 + ((ua ^ ~-2) & ua) + -1491303093) | ~-2) & (1301399310 | ~1301399310);
                cb = (ua ^ ~1) & ua;
                eb = Ka;
                fb = Ja;
                gb = Ha;
                hb = d;
                ib = e;
                jb = Fa;
                kb = Ea;
                lb = Da;
                mb = Ca;
                nb = Ba;
                ob = ya;
                pb = va;
                qb = ua;
                ta = wa;
                f = 141;
                ua = (bb & cb | bb ^ cb) - (0 - ((db ^ ~1) & db)) | 0;
                xa = db;
                za = za - (0 - 1) | 0;
                Ka = eb;
                Ja = fb;
                Ha = gb;
                d = hb;
                e = ib;
                Fa = jb;
                Ea = kb;
                Da = lb;
                Ca = mb;
                Ba = nb;
                ya = ob;
                wa = pb;
                va = qb;
                goto b;
            }case 7:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                xa = ta;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 157;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 119:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (za | 0) < 32 ? 117 : 97;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 5:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (ya | 0) == 1 ? 3 : 1;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 4:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (za | 0) < 4 ? 0 : 152;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 117:
            {
                Ha = ~wa | 0 | wa & ~-1;
                Za = 223327204 & ~ua | ua & ~223327204;
                ab = ~Za;
                Ia = ~Ha;
                $a = ~-381686885;
                $a = (ab & -381686885 | Za & $a) ^ (Ia & -381686885 | Ha & $a) | ~(ab | Ia) & (-381686885 | $a);
                Ia = ~2088055561;
                Ia = (2088055561 & ~va | va & Ia) ^ (~223327204 & 2088055561 | 223327204 & Ia);
                ab = ~wa;
                Za = ~Ia;
                _a = ~-1424487794;
                _a = (ab & -1424487794 | wa & _a) ^ (Za & -1424487794 | Ia & _a) | ~(ab | Za) & (-1424487794 | _a);
                $a = ($a ^ ~223327204) & $a;
                Za = ~(~ua | ~-223327205) & (~-1513562601 | -1513562601);
                Za = (Za ^ ~wa) & Za;
                _a = (_a ^ ~223327204) & _a;
                Ha = (Ha ^ ~-223327205) & Ha;
                Ha = (Ha ^ ~(va & ~wa | wa & ~va)) & Ha;
                Za = $a & Za | $a ^ Za;
                _a = Ha & _a | Ha ^ _a;
                Ha = ~539859515;
                Ha = (539859515 & ~_a | _a & Ha) ^ (~Za & 539859515 | Za & Ha);
                Za = ~(~((~(~ta | ~-2) & (~-479053452 | -479053452)) - (0 - Ha)) | ~-2) & (775604796 | ~775604796);
                _a = (ta ^ ~1) & ta;
                $a = ~Za;
                ab = ~_a;
                Ia = ~-89952541;
                bb = Ka;
                cb = Ja;
                db = Ga;
                eb = d;
                fb = e;
                gb = Fa;
                hb = Ea;
                ib = Da;
                jb = Ca;
                kb = Ba;
                lb = za;
                mb = ya;
                nb = wa;
                ob = va;
                pb = ua;
                qb = ta;
                f = 116;
                sa = 0 - (0 - Ba + (0 + 1)) >> 2;
                xa = Ha;
                Ha = (($a & -89952541 | Za & Ia) ^ (ab & -89952541 | _a & Ia) | ~($a | ab) & (-89952541 | Ia)) + 1116549971 + (~(~Ha | ~1) & (~-875125272 | -875125272)) - 1116549971 | 0;
                Ia = 0 - (0 - (((za * 5 | 0) + 106029065 + 1 + -106029065 | 0) % 16 | 0) + (0 - ya)) | 0;
                Ka = bb;
                Ja = cb;
                Ga = db;
                d = eb;
                e = fb;
                Fa = gb;
                Ea = hb;
                Da = ib;
                Ca = jb;
                Ba = kb;
                za = lb;
                ya = mb;
                wa = nb;
                va = ob;
                ua = pb;
                ta = qb;
                goto b;
            }case 3:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                xa = ua;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 157;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 116:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (Ia | 0) > (Ba + 77471208 + 32 - 77471208 >> 2 | 0) ? 104 : 115;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 115:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (Ia | 0) > (sa | 0) ? 114 : 111;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 1:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (ya | 0) == 2 ? 161 : 159;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 114:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = (e | 0) > 0 ? 113 : 112;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 0:
            {
                _a = Ka;
                $a = Ja;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 160;
                Ia = ((((ya * 27 | 0) - (0 - (za * 62 | 0)) - (0 - (((0 - (0 - (ya * 84 | 0) + (0 - 21)) | 0) * ((za * 28 | 0) + 1910606658 + 97 + -1910606658 | 0)) | 0)) | 0) * 5 | 0) + 426025673 + 615 - 426025673 | 0) % 32 | 0;
                Ka = _a;
                Ja = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }case 113:
            {
                _a = Ka;
                $a = Ja;
                ab = Ia;
                bb = Ha;
                cb = Ga;
                db = d;
                eb = e;
                fb = Fa;
                gb = Ea;
                hb = Da;
                ib = Ca;
                jb = Ba;
                kb = za;
                lb = ya;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                f = 99;
                xa = c[La + (Ia + 1501901147 - sa + -1501901147 << 2) >> 2] | 0;
                Ka = _a;
                Ja = $a;
                Ia = ab;
                Ha = bb;
                Ga = cb;
                d = db;
                e = eb;
                Fa = fb;
                Ea = gb;
                Da = hb;
                Ca = ib;
                Ba = jb;
                za = kb;
                ya = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }default:
            {
                Za = Ka;
                _a = Ja;
                $a = Ia;
                ab = Ha;
                bb = Ga;
                cb = d;
                db = e;
                eb = Fa;
                fb = Ea;
                gb = Da;
                hb = Ca;
                ib = Ba;
                jb = za;
                kb = ya;
                lb = xa;
                mb = wa;
                nb = va;
                ob = ua;
                pb = ta;
                qb = sa;
                Ka = Za;
                Ja = _a;
                Ia = $a;
                Ha = ab;
                Ga = bb;
                d = cb;
                e = db;
                Fa = eb;
                Ea = fb;
                Da = gb;
                Ca = hb;
                Ba = ib;
                za = jb;
                ya = kb;
                xa = lb;
                wa = mb;
                va = nb;
                ua = ob;
                ta = pb;
                sa = qb;
                goto b;
            }
        }
    }

    a:
//        while (false);
    if ((Ma | 0) == 136) {
        i = Na;
        int ch = 0;
        int ci = 0;
        while (true) {
            Byte ct = Rq[d + ci >> 0];
            ch |= ct;
            if (ct == 0)
                break;
            ci++;
        }
        NSString * cr = @"";
        if (ch < 128) {
            while (ci > 0) {
                uint8_t crArray[ci < 1024 ? ci : 1024];
                NSLog(@"%zu", ((sizeof crArray) / (sizeof crArray[0])));
                for (int index = 0; index < ((sizeof crArray) / (sizeof crArray[0])); index++) {
                    crArray[index] = Rq[index + d];
                }
                NSString * cu = [[NSString stringWithUTF8String:crArray] substringWithRange:NSMakeRange(0, (sizeof crArray) / (sizeof crArray[0]))];//String.fromCharCode.apply(String, Rq.subarray(d, d + Math.min(ci, 1024)));
                cr = [cr isEqualToString:@""] ? cu : [NSString stringWithFormat:@"%@%@", cr, cu];
                d += 1024;
                ci -= 1024;
            }
            return cr;
        }
    }
    i = Na;
    return @"";
}

+ (int) cmd5xt: (int) a c: (int[]) c pt: (int) pt {
    a = a | 0;
    int  b = 0;
    int  d = 0;
    int  e = 0;
    int  f = 0;
    int  g = 0;
    int  h = 0;
    int  i = 0;
    int  j = 0;
    int  k = 0;
    int  l = 0;
    int  m = 0;
    int  n = 0;
    int  o = 0;
    int  p = 0;
    int  q = 0;
    int  r = 0;
    int  s = 0;
    int  t = 0;
    int  u = 0;
    int  v = 0;
    int  w = 0;
    int  x = 0;
    int  y = 0;
    int  z = 0;
    int  A = 0;
    int  B = 0;
    int  C = 0;
    int  D = 0;
    int  E = 0;
    int  F = 0;
    int  G = 0;
    int  H = 0;
    int  I = 0;
    int  J = 0;
    int  K = 0;
    int  L = 0;
    do if ((uint)(a & 0xffffffff) >> 0 < 245) {
            o = (uint)(a & 0xffffffff) >> 0 < 11 ? 16 : a + 11 & -8;
            a = (uint)(o & 0xffffffff) >> 3;
            j = c[48] | 0;
            b = (uint)(j & 0xffffffff) >> a;
            if ((b & 3 | 0) != 0) {
                b = (b & 1 ^ 1) + a | 0;
                d = 232 + (b << 1 << 2) | 0;
                e = d + 8 | 0;
                f = c[e >> 2] | 0;
                g = f + 8 | 0;
                h = c[g >> 2] | 0;
                do if ((d | 0) != (h | 0)) {
                        a = h + 12 | 0;
                        if ((c[a >> 2] | 0) == (f | 0)) {
                            c[a >> 2] = d;
                            c[e >> 2] = h;
                            break;
                        }
                    } else
                        c[48] = j & ~(1 << b);
                while (false);
                L = b << 3;
                c[f + 4 >> 2] = L | 3;
                L = f + L + 4 | 0;
                c[L >> 2] = c[L >> 2] | 1;
                L = g;
                return L | 0;
            }
            h = c[50] | 0;
            if ((uint)(0 & 0xffffffff) >> 0 > (uint)(h & 0xffffffff) >> 0) {
                if ((b | 0) != 0) {
                    d = 2 << a;
                    d = b << a & (d | 0 - d);
                    d = (d & 0 - d) + -1 | 0;
                    i = (uint)(d & 0xffffffff) >> 12 & 16;
                    d = (uint)(d & 0xffffffff) >> i;
                    f = (uint)(d & 0xffffffff) >> 5 & 8;
                    d = (uint)(d & 0xffffffff) >> f;
                    g = (uint)(d & 0xffffffff) >> 2 & 4;
                    d = (uint)(d & 0xffffffff) >> g;
                    e = (uint)(d & 0xffffffff) >> 1 & 2;
                    d = (uint)(d & 0xffffffff) >> e;
                    b = (uint)(d & 0xffffffff) >> 1 & 1;
                    b = (f | i | g | e | b) + ((uint)(d & 0xffffffff) >> b) | 0;
                    d = 232 + (b << 1 << 2) | 0;
                    e = d + 8 | 0;
                    g = c[e >> 2] | 0;
                    i = g + 8 | 0;
                    f = c[i >> 2] | 0;
                    do if ((d | 0) != (f | 0)) {
                            a = f + 12 | 0;
                            if ((c[a >> 2] | 0) == (g | 0)) {
                                c[a >> 2] = d;
                                c[e >> 2] = f;
                                k = c[50] | 0;
                                break;
                            }
                        } else {
                            c[48] = j & ~(1 << b);
                            k = h;
                        }
                    while (false);
                    h = (b << 3) - o | 0;
                    c[g + 4 >> 2] = o | 3;
                    e = g + o | 0;
                    c[e + 4 >> 2] = h | 1;
                    c[e + h >> 2] = h;
                    if ((k | 0) != 0) {
                        f = c[53] | 0;
                        b = (uint)(k & 0xffffffff) >> 3;
                        d = 232 + (b << 1 << 2) | 0;
                        a = c[48] | 0;
                        b = 1 << b;
                        if ((a & b) != 0) {
                            a = d + 8 | 0;
                            b = c[a >> 2] | 0;
                            if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                l = a;
                                m = b;
                            }
                        } else {
                            c[48] = a | b;
                            l = d + 8 | 0;
                            m = d;
                        }
                        c[l >> 2] = f;
                        c[m + 12 >> 2] = f;
                        c[f + 8 >> 2] = m;
                        c[f + 12 >> 2] = d;
                    }
                    c[50] = h;
                    c[53] = e;
                    L = i;
                    return L | 0;
                }
                a = c[49] | 0;
                if (a != 0) {
                    d = (a & 0 - a) + -1 | 0;
                    K = (uint)(d & 0xffffffff) >> 12 & 16;
                    d = (uint)(d & 0xffffffff) >> K;
                    J = (uint)(d & 0xffffffff) >> 5 & 8;
                    d = (uint)(d & 0xffffffff) >> J;
                    L = (uint)(d & 0xffffffff) >> 2 & 4;
                    d = (uint)(d & 0xffffffff) >> L;
                    b = (uint)(d & 0xffffffff) >> 1 & 2;
                    d = (uint)(d & 0xffffffff) >> b;
                    e = (uint)(d & 0xffffffff) >> 1 & 1;
                    e = c[496 + ((J | K | L | b | e) + ((uint)(d & 0xffffffff) >> e) << 2) >> 2] | 0;
                    d = (c[e + 4 >> 2] & -8) - o | 0;
                    b = e;
                    while (true) {
                        a = c[b + 16 >> 2] | 0;
                        if (!(a != 0)) {
                            a = c[b + 20 >> 2] | 0;
                            if (!(a != 0)) {
                                j = e;
                                break;
                            }
                        }
                        b = (c[a + 4 >> 2] & -8) - o | 0;
                        L = (((uint)(b & 0xffffffff) >> 0) < ((uint)(d & 0xffffffff) >> 0)) ? 1 : 0;
                        d = (L != 0) ? b : d;
                        b = a;
                        e = (L != 0) ? a : e;
                    }
                    g = c[52] | 0;
                    i = j + o | 0;
                    h = c[j + 24 >> 2] | 0;
                    e = c[j + 12 >> 2] | 0;
                    do if ((e | 0) == (j | 0)) {
                            b = j + 20 | 0;
                            a = c[b >> 2] | 0;
                            if (!(a != 0)) {
                                b = j + 16 | 0;
                                a = c[b >> 2] | 0;
                                if (!(a != 0)) {
                                    n = 0;
                                    break;
                                }
                            }
                            while (true) {
                                e = a + 20 | 0;
                                f = c[e >> 2] | 0;
                                if ((f | 0) != 0) {
                                    a = f;
                                    b = e;
                                    continue;
                                }
                                e = a + 16 | 0;
                                f = c[e >> 2] | 0;
                                if (!(f != 0))
                                    break;
                                else {
                                    a = f;
                                    b = e;
                                }
                            }
                            if (!((uint)(b & 0xffffffff) >> 0 < (uint)(g & 0xffffffff) >> 0)) {
                                c[b >> 2] = 0;
                                n = a;
                                break;
                            }
                        } else {
                            f = c[j + 8 >> 2] | 0;
                            a = f + 12 | 0;
                            b = e + 8 | 0;
                            if ((c[b >> 2] | 0) == (j | 0)) {
                                c[a >> 2] = e;
                                c[b >> 2] = f;
                                n = e;
                                break;
                            }
                        }
                    while (false);
                    do if ((h | 0) != 0) {
                            a = c[j + 28 >> 2] | 0;
                            b = 496 + (a << 2) | 0;
                            if ((j | 0) == (c[b >> 2] | 0)) {
                                c[b >> 2] = n;
                                if (!(n != 0)) {
                                    c[49] = c[49] & ~(1 << a);
                                    break;
                                }
                            } else {
                                a = h + 16 | 0;
                                if ((c[a >> 2] | 0) == (j | 0))
                                    c[a >> 2] = n;
                                else
                                    c[h + 20 >> 2] = n;
                                if (!(n != 0))
                                    break;
                            }
                            b = c[52] | 0;
                            c[n + 24 >> 2] = h;
                            a = c[j + 16 >> 2] | 0;
                            do if ((a | 0) != 0)
                                    if (!((uint)(a & 0xffffffff) >> 0 < (uint)(b & 0xffffffff) >> 0)) {
                                        c[n + 16 >> 2] = a;
                                        c[a + 24 >> 2] = n;
                                        break;
                                    }
                            while (true);
                            a = c[j + 20 >> 2] | 0;
                            if ((a | 0) != 0)
                                if (!((uint)(a & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                    c[n + 20 >> 2] = a;
                                    c[a + 24 >> 2] = n;
                                    break;
                                }
                        }
                    while (false);
                    if ((uint)(d & 0xffffffff) >> 0 < 16) {
                        L = d + o | 0;
                        c[j + 4 >> 2] = L | 3;
                        L = j + L + 4 | 0;
                        c[L >> 2] = c[L >> 2] | 1;
                    } else {
                        c[j + 4 >> 2] = o | 3;
                        c[i + 4 >> 2] = d | 1;
                        c[i + d >> 2] = d;
                        a = c[50] | 0;
                        if ((a | 0) != 0) {
                            f = c[53] | 0;
                            b = (uint)(a & 0xffffffff) >> 3;
                            e = 232 + (b << 1 << 2) | 0;
                            a = c[48] | 0;
                            b = 1 << b;
                            if ((a & b) != 0) {
                                a = e + 8 | 0;
                                b = c[a >> 2] | 0;
                                if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                    p = a;
                                    q = b;
                                }
                            } else {
                                c[48] = a | b;
                                p = e + 8 | 0;
                                q = e;
                            }
                            c[p >> 2] = f;
                            c[q + 12 >> 2] = f;
                            c[f + 8 >> 2] = q;
                            c[f + 12 >> 2] = e;
                        }
                        c[50] = d;
                        c[53] = i;
                    }
                    L = j + 8 | 0;
                    return L | 0;
                }
            }
        } else if ((long)((uint)(a & 0xffffffff) >> 0 & 0xffff) <= 4294967231L) {
            a = a + 11 | 0;
            o = a & -8;
            j = c[49] | 0;
            if (j != 0) {
                d = 0 - o | 0;
                a = (uint)(a & 0xffffffff) >> 8;
                if (a != 0)
                    if ((uint)(o & 0xffffffff) >> 0 > 16777215)
                        i = 31;
                    else {
                        q = (uint)((a + 1048320 | 0) & 0xffffffff) >> 16 & 8;
                        E = a << q;
                        p = (uint)((E + 520192 | 0) & 0xffffffff) >> 16 & 4;
                        E = E << p;
                        i = (uint)((E + 245760 | 0) & 0xffffffff) >> 16 & 2;
                        i = 14 - (p | q | i) + (E << (uint)(i & 0xffffffff) >> 15) | 0;
                        i = (uint)(o & 0xffffffff) >> (i + 7 | 0) & 1 | i << 1;
                    }
                else
                    i = 0;
                b = c[496 + (i << 2) >> 2] | 0;
                a:
                do if (!(b != 0)) {
                        a = 0;
                        b = 0;
                        E = 86;
                    } else {
                        f = d;
                        a = 0;
                        g = o << ((i | 0) == 31 ? 0 : 25 - ((uint)(i & 0xffffffff) >> 1) | 0);
                        h = b;
                        b = 0;
                        while (true) {
                            e = c[h + 4 >> 2] & -8;
                            d = e - o | 0;
                            if ((uint)(d & 0xffffffff) >> 0 < (uint)(f & 0xffffffff) >> 0)
                                if ((e | 0) == (o | 0)) {
                                    a = h;
                                    b = h;
                                    E = 90;
                                    goto v;
                                } else
                                    b = h;
                            else
                                d = f;
                            e = c[h + 20 >> 2] | 0;
                            h = c[h + 16 + ((uint)(g & 0xffffffff) >> 31 << 2) >> 2] | 0;
                            a = (e | 0) == 0 || (e | 0) == (h | 0) ? a : e;
                            e = (h | 0) == 0 ? 1 : 0;
                            if (e != 0) {
                                E = 86;
                                break;
                            } else {
                                f = d;
                                g = g << (e & 1 ^ 1);
                            }
                        }
                    }
                while (false);
                v:
                if ((E | 0) == 86) {
                    if ((a | 0) == 0 && (b | 0) == 0) {
                        a = 2 << i;
                        a = j & (a | 0 - a);
                        if (!(a != 0))
                            break;
                        q = (a & 0 - a) + -1 | 0;
                        m = (uint)(q & 0xffffffff) >> 12 & 16;
                        q = (uint)(q & 0xffffffff) >> m;
                        l = (uint)(q & 0xffffffff) >> 5 & 8;
                        q = (uint)(q & 0xffffffff) >> l;
                        n = (uint)(q & 0xffffffff) >> 2 & 4;
                        q = (uint)(q & 0xffffffff) >> n;
                        p = (uint)(q & 0xffffffff) >> 1 & 2;
                        q = (uint)(q & 0xffffffff) >> p;
                        a = (uint)(q & 0xffffffff) >> 1 & 1;
                        a = c[496 + ((l | m | n | p | a) + ((uint)(q & 0xffffffff) >> a) << 2) >> 2] | 0;
                    }
                    if (!(a != 0)) {
                        i = d;
                        j = b;
                    } else
                        E = 90;
                }
                if ((E | 0) == 90)
                    while (true) {
                        E = 0;
                        q = (c[a + 4 >> 2] & -8) - o | 0;
                        e = ((uint)(q & 0xffffffff) >> 0 < (uint)(d & 0xffffffff) >> 0) ? 1 : 0;
                        d = (e != 0) ? q : d;
                        b = (e != 0) ? a : b;
                        e = c[a + 16 >> 2] | 0;
                        if ((e | 0) != 0) {
                            a = e;
                            E = 90;
                            continue;
                        }
                        a = c[a + 20 >> 2] | 0;
                        if (!(a != 0)) {
                            i = d;
                            j = b;
                            break;
                        } else
                            E = 90;
                    }
                if ((j | 0) != 0 ? (uint)(i & 0xffffffff) >> 0 < (uint)(((c[50] | 0) - o | 0) & 0xffffffff) >> 0 : false) {
                    f = c[52] | 0;
                    h = j + o | 0;
                    g = c[j + 24 >> 2] | 0;
                    d = c[j + 12 >> 2] | 0;
                    do if ((d | 0) == (j | 0)) {
                            b = j + 20 | 0;
                            a = c[b >> 2] | 0;
                            if (!(a != 0)) {
                                b = j + 16 | 0;
                                a = c[b >> 2] | 0;
                                if (!(a != 0)) {
                                    s = 0;
                                    break;
                                }
                            }
                            while (true) {
                                d = a + 20 | 0;
                                e = c[d >> 2] | 0;
                                if ((e | 0) != 0) {
                                    a = e;
                                    b = d;
                                    continue;
                                }
                                d = a + 16 | 0;
                                e = c[d >> 2] | 0;
                                if (!(e != 0))
                                    break;
                                else {
                                    a = e;
                                    b = d;
                                }
                            }
                            if (!((uint)(b & 0xffffffff) >> 0 < (uint)(f & 0xffffffff) >> 0)) {
                                c[b >> 2] = 0;
                                s = a;
                                break;
                            }
                        } else {
                            e = c[j + 8 >> 2] | 0;
                            a = e + 12 | 0;
                            b = d + 8 | 0;
                            if ((c[b >> 2] | 0) == (j | 0)) {
                                c[a >> 2] = d;
                                c[b >> 2] = e;
                                s = d;
                                break;
                            }
                        }
                    while (false);
                    do if ((g | 0) != 0) {
                            a = c[j + 28 >> 2] | 0;
                            b = 496 + (a << 2) | 0;
                            if ((j | 0) == (c[b >> 2] | 0)) {
                                c[b >> 2] = s;
                                if (!(s != 0)) {
                                    c[49] = c[49] & ~(1 << a);
                                    break;
                                }
                            } else {
                                a = g + 16 | 0;
                                if ((c[a >> 2] | 0) == (j | 0))
                                    c[a >> 2] = s;
                                else
                                    c[g + 20 >> 2] = s;
                                if (!(s != 0))
                                    break;
                            }
                            b = c[52] | 0;
                            c[s + 24 >> 2] = g;
                            a = c[j + 16 >> 2] | 0;
                            do if ((a | 0) != 0)
                                    if (!((uint)(a & 0xffffffff) >> 0 < (uint)(b & 0xffffffff) >> 0)) {
                                        c[s + 16 >> 2] = a;
                                        c[a + 24 >> 2] = s;
                                        break;
                                    }
                            while (false);
                            a = c[j + 20 >> 2] | 0;
                            if ((a | 0) != 0)
                                if (!((uint)(a & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                    c[s + 20 >> 2] = a;
                                    c[a + 24 >> 2] = s;
                                    break;
                                }
                        }
                    while (false);
                    do if ((uint)(i & 0xffffffff) >> 0 >= 16) {
                            c[j + 4 >> 2] = o | 3;
                            c[h + 4 >> 2] = i | 1;
                            c[h + i >> 2] = i;
                            a = (uint)(i & 0xffffffff) >> 3;
                            if ((uint)(i & 0xffffffff) >> 0 < 256) {
                                d = 232 + (a << 1 << 2) | 0;
                                b = c[48] | 0;
                                a = 1 << a;
                                if ((b & a) != 0) {
                                    a = d + 8 | 0;
                                    b = c[a >> 2] | 0;
                                    if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                        u = a;
                                        v = b;
                                    }
                                } else {
                                    c[48] = b | a;
                                    u = d + 8 | 0;
                                    v = d;
                                }
                                c[u >> 2] = h;
                                c[v + 12 >> 2] = h;
                                c[h + 8 >> 2] = v;
                                c[h + 12 >> 2] = d;
                                break;
                            }
                            a = (uint)(i & 0xffffffff) >> 8;
                            if (a != 0)
                                if ((uint)(i & 0xffffffff) >> 0 > 16777215)
                                    d = 31;
                                else {
                                    K = (uint)((a + 1048320 | 0) & 0xffffffff) >> 16 & 8;
                                    L = a << K;
                                    J = (uint)((L + 520192 | 0) & 0xffffffff) >> 16 & 4;
                                    L = L << J;
                                    d = (uint)((L + 245760 | 0) & 0xffffffff) >> 16 & 2;
                                    d = 14 - (J | K | d) + (L << (uint)(d & 0xffffffff) >> 15) | 0;
                                    d = (uint)(i & 0xffffffff) >> (d + 7 | 0) & 1 | d << 1;
                                }
                            else
                                d = 0;
                            e = 496 + (d << 2) | 0;
                            c[h + 28 >> 2] = d;
                            a = h + 16 | 0;
                            c[a + 4 >> 2] = 0;
                            c[a >> 2] = 0;
                            a = c[49] | 0;
                            b = 1 << d;
                            if (!((a & b) != 0)) {
                                c[49] = a | b;
                                c[e >> 2] = h;
                                c[h + 24 >> 2] = e;
                                c[h + 12 >> 2] = h;
                                c[h + 8 >> 2] = h;
                                break;
                            }
                            f = i << ((d | 0) == 31 ? 0 : 25 - ((uint)(d & 0xffffffff) >> 1) | 0);
                            a = c[e >> 2] | 0;
                            while (true) {
                                if ((c[a + 4 >> 2] & -8 | 0) == (i | 0)) {
                                    d = a;
                                    E = 148;
                                    break;
                                }
                                b = a + 16 + ((uint)(f & 0xffffffff) >> 31 << 2) | 0;
                                d = c[b >> 2] | 0;
                                if (!(d != 0)) {
                                    E = 145;
                                    break;
                                } else {
                                    f = f << 1;
                                    a = d;
                                }
                            }
                            if ((E | 0) == 145)
                                if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                    c[b >> 2] = h;
                                    c[h + 24 >> 2] = a;
                                    c[h + 12 >> 2] = h;
                                    c[h + 8 >> 2] = h;
                                    break;
                                } else if ((E | 0) == 148) {
                                    a = d + 8 | 0;
                                    b = c[a >> 2] | 0;
                                    L = c[52] | 0;
                                    if ((uint)(b & 0xffffffff) >> 0 >= (uint)(L & 0xffffffff) >> 0 && (uint)(d & 0xffffffff) >> 0 >= (uint)(L & 0xffffffff) >> 0) {
                                        c[b + 12 >> 2] = h;
                                        c[a >> 2] = h;
                                        c[h + 8 >> 2] = b;
                                        c[h + 12 >> 2] = d;
                                        c[h + 24 >> 2] = 0;
                                        break;
                                    }
                                }
                        } else {
                            L = i + o | 0;
                            c[j + 4 >> 2] = L | 3;
                            L = j + L + 4 | 0;
                            c[L >> 2] = c[L >> 2] | 1;
                        }
                    while (false);
                    L = j + 8 | 0;
                    return L | 0;
                }
            }
        } else
            o = -1;
    while (false);
    d = c[50] | 0;
    if ((uint)(d & 0xffffffff) >> 0 >= (uint)(o & 0xffffffff) >> 0) {
        a = d - o | 0;
        b = c[53] | 0;
        if ((uint)(a & 0xffffffff) >> 0 > 15) {
            L = b + o | 0;
            c[53] = L;
            c[50] = a;
            c[L + 4 >> 2] = a | 1;
            c[L + a >> 2] = a;
            c[b + 4 >> 2] = o | 3;
        } else {
            c[50] = 0;
            c[53] = 0;
            c[b + 4 >> 2] = d | 3;
            L = b + d + 4 | 0;
            c[L >> 2] = c[L >> 2] | 1;
        }
        L = b + 8 | 0;
        return L | 0;
    }
    a = c[51] | 0;
    if ((uint)(a & 0xffffffff) >> 0 > (uint)(o & 0xffffffff) >> 0) {
        J = a - o | 0;
        c[51] = J;
        L = c[54] | 0;
        K = L + o | 0;
        c[54] = K;
        c[K + 4 >> 2] = J | 1;
        c[L + 4 >> 2] = o | 3;
        L = L + 8 | 0;
        return L | 0;
    }
    do if (!((c[166] | 0) != 0)) {
            a = 4096;
            if (!((a + -1 & a) != 0)) {
                c[168] = a;
                c[167] = a;
                c[169] = -1;
                c[170] = -1;
                c[171] = 0;
                c[159] = 0;
                c[166] = (int)([[NSDate date]timeIntervalSince1970] / 1e3) & -16 ^ 1431655768;
                break;
            }
        }
    while (false);
    h = o + 48 | 0;
    g = c[168] | 0;
    i = o + 47 | 0;
    f = g + i | 0;
    g = 0 - g | 0;
    j = f & g;
    if ((uint)(j & 0xffffffff) >> 0 <= (uint)(o & 0xffffffff) >> 0) {
        L = 0;
        return L | 0;
    }
    a = c[158] | 0;
    if ((a | 0) != 0) {
        u = c[156] | 0;
        v = u + j | 0;
    } else {

    }
    if ((a | 0) != 0 ? ((uint)(v & 0xffffffff) >> 0 <= (uint)(u & 0xffffffff) >> 0 || (uint)(v & 0xffffffff) >> 0 > (uint)(a & 0xffffffff) >> 0) : false) {
        L = 0;
        return L | 0;
    }
    b:
    do if (!((c[159] & 4) != 0)) {
            a = c[54] | 0;
            c:
            do if (a != 0) {
                    d = 640;
                    while (true) {
                        b = c[d >> 2] | 0;
                        if ((uint)(b & 0xffffffff) >> 0 <= (uint)(a & 0xffffffff) >> 0) {
                            r = d + 4 | 0;
                        } else {

                        }
                        if ((uint)(b & 0xffffffff) >> 0 <= (uint)(a & 0xffffffff) >> 0 ? (uint)(((b + (c[r >> 2] | 0) | 0) & 0xffffffff) >> 0 > (uint)(a & 0xffffffff) >> 0) : false) {
                            e = d;
                            d = r;
                            break;
                        }
                        d = c[d + 8 >> 2] | 0;
                        if (!(d != 0)) {
                            E = 173;
                            goto u;
                        }
                    }
                    a = f - (c[51] | 0) & g;
                    if ((uint)(a & 0xffffffff) >> 0 < 2147483647) {
                        b = pt;
                        if ((b | 0) == ((c[e >> 2] | 0) + (c[d >> 2] | 0) | 0)) {
                            if ((b | 0) != (-1 | 0)) {
                                h = b;
                                f = a;
                                E = 193;
                                goto x;
                            }
                        } else
                            E = 183;
                    }
                } else
                    E = 173;
            while (false);
            u:
            do {
                if ((E | 0) == 173) {
                    t = pt;
                }
                if ((E | 0) == 173 ? ((t | 0) != (-1 | 0)) : false) {
                    a = t;
                    b = c[167] | 0;
                    d = b + -1 | 0;
                    if (!((d & a) != 0))
                        a = j;
                    else
                        a = j - a + (d + a & 0 - b) | 0;
                    b = c[156] | 0;
                    d = b + a | 0;
                    if ((uint)(a & 0xffffffff) >> 0 > (uint)(o & 0xffffffff) >> 0 && (uint)(a & 0xffffffff) >> 0 < 2147483647) {
                        v = c[158] | 0;
                        if (((v | 0) != 0) ? (uint)(d & 0xffffffff) >> 0 <= (uint)(b & 0xffffffff) >> 0 || (uint)(d & 0xffffffff) >> 0 > (uint)(v & 0xffffffff) >> 0 : false)
                            break;
                        b = pt;
                        if ((b | 0) == (t | 0)) {
                            h = t;
                            f = a;
                            E = 193;
                            goto x;
                        } else
                            E = 183;
                    }
                }
            }
            while (false);
            d:
            do if ((E | 0) == 183) {
                    d = 0 - a | 0;
                    do {
                        if ((uint)(h & 0xffffffff) >> 0 > (uint)(a & 0xffffffff) >> 0 && ((uint)(a & 0xffffffff) >> 0 < 2147483647 && (b | 0) != (-1 | 0))) {
                            w = c[168] | 0;
                            w = i - a + w & 0 - w;
                        }
                        if ((uint)(h & 0xffffffff) >> 0 > (uint)(a & 0xffffffff) >> 0 && ((uint)(a & 0xffffffff) >> 0 < 2147483647 && (b | 0) != (-1 | 0)) ? ((uint)(w & 0xffffffff) >> 0 < 2147483647) : false)
                            if (pt == (-1 | 0)) {
//                        pt;
                                goto y;
                            } else {
                                a = w + a | 0;
                                break;
                            }
                    }
                    while (false);
                    if ((b | 0) != (-1 | 0)) {
                        h = b;
                        f = a;
                        E = 193;
                        goto x;
                    }
                }
            while (false);
            y:
            c[159] = c[159] | 4;
            E = 190;
        } else {
            E = 190;
        }
    while (false);
    x:
    if (((E | 0) == 190 ? (uint)(j & 0xffffffff) >> 0 < 2147483647 : false)) {
        x = pt;
        y = pt;
        if ((uint)(x & 0xffffffff) >> 0 < (uint)(y & 0xffffffff) >> 0 && ((x | 0) != (-1 | 0) && (y | 0) != (-1 | 0))) {
            z = y - x | 0;
        }
    }
    if ((((E | 0) == 190 ? (uint)(j & 0xffffffff) >> 0 < 2147483647 : false) ? ((uint)(x & 0xffffffff) >> 0 < (uint)(y & 0xffffffff) >> 0 && ((x | 0) != (-1 | 0) && (y | 0) != (-1 | 0))) : false) ? ((uint)(z & 0xffffffff) >> 0 > ((uint)((o + 40 | 0) & 0xffffffff) >> 0)) : false) {
        h = x;
        f = z;
        E = 193;
    }
    if ((E | 0) == 193) {
        a = (c[156] | 0) + f | 0;
        c[156] = a;
        if ((uint)(a & 0xffffffff) >> 0 > (uint)((c[157] | 0) & 0xffffffff) >> 0)
            c[157] = a;
        i = c[54] | 0;
        do if (i != 0) {
                e = 640;
                do {
                    a = c[e >> 2] | 0;
                    b = e + 4 | 0;
                    d = c[b >> 2] | 0;
                    if ((h | 0) == (a + d | 0)) {
                        A = a;
                        B = b;
                        C = d;
                        D = e;
                        E = 203;
                        break;
                    }
                    e = c[e + 8 >> 2] | 0;
                } while ((e | 0) != 0);
                if (((E | 0) == 203 ? (c[D + 12 >> 2] & 8 | 0) == 0 : false) ? (uint)(i & 0xffffffff) >> 0 < (uint)(h & 0xffffffff) >> 0 && (uint)(i & 0xffffffff) >> 0 >= (uint)(a & 0xffffffff) >> 0 : false) {
                    c[B >> 2] = C + f;
                    L = i + 8 | 0;
                    L = (L & 7 | 0) == 0 ? 0 : 0 - L & 7;
                    K = i + L | 0;
                    L = f - L + (c[51] | 0) | 0;
                    c[54] = K;
                    c[51] = L;
                    c[K + 4 >> 2] = L | 1;
                    c[K + L + 4 >> 2] = 40;
                    c[55] = c[170];
                    break;
                }
                a = c[52] | 0;
                if ((uint)(h & 0xffffffff) >> 0 < (uint)(a & 0xffffffff) >> 0) {
                    c[52] = h;
                    j = h;
                } else
                    j = a;
                d = h + f | 0;
                a = 640;
                while (true) {
                    if ((c[a >> 2] | 0) == (d | 0)) {
                        b = a;
                        E = 211;
                        break;
                    }
                    a = c[a + 8 >> 2] | 0;
                    if (!(a != 0)) {
                        b = 640;
                        break;
                    }
                }
                if ((E | 0) == 211)
                    if (!((c[a + 12 >> 2] & 8) != 0)) {
                        c[b >> 2] = h;
                        l = a + 4 | 0;
                        c[l >> 2] = (c[l >> 2] | 0) + f;
                        l = h + 8 | 0;
                        l = h + ((l & 7 | 0) == 0 ? 0 : 0 - l & 7) | 0;
                        a = d + 8 | 0;
                        a = d + ((a & 7 | 0) == 0 ? 0 : 0 - a & 7) | 0;
                        k = l + o | 0;
                        g = a - l - o | 0;
                        c[l + 4 >> 2] = o | 3;
                        do if ((a | 0) != (i | 0)) {
                                if ((a | 0) == (c[53] | 0)) {
                                    L = (c[50] | 0) + g | 0;
                                    c[50] = L;
                                    c[53] = k;
                                    c[k + 4 >> 2] = L | 1;
                                    c[k + L >> 2] = L;
                                    break;
                                }
                                b = c[a + 4 >> 2] | 0;
                                if ((b & 3 | 0) == 1) {
                                    i = b & -8;
                                    f = (uint)(b & 0xffffffff) >> 3;
                                    e:
                                    do if ((uint)(b & 0xffffffff) >> 0 >= 256) {
                                            h = c[a + 24 >> 2] | 0;
                                            e = c[a + 12 >> 2] | 0;
                                            do if ((e | 0) == (a | 0)) {
                                                    d = a + 16 | 0;
                                                    e = d + 4 | 0;
                                                    b = c[e >> 2] | 0;
                                                    if (!(b != 0)) {
                                                        b = c[d >> 2] | 0;
                                                        if (!(b != 0)) {
                                                            J = 0;
                                                            break;
                                                        }
                                                    } else
                                                        d = e;
                                                    while (true) {
                                                        e = b + 20 | 0;
                                                        f = c[e >> 2] | 0;
                                                        if ((f | 0) != 0) {
                                                            b = f;
                                                            d = e;
                                                            continue;
                                                        }
                                                        e = b + 16 | 0;
                                                        f = c[e >> 2] | 0;
                                                        if (!(f != 0))
                                                            break;
                                                        else {
                                                            b = f;
                                                            d = e;
                                                        }
                                                    }
                                                    if (!((uint)(d & 0xffffffff) >> 0 < (uint)(j & 0xffffffff) >> 0)) {
                                                        c[d >> 2] = 0;
                                                        J = b;
                                                        break;
                                                    }
                                                } else {
                                                    f = c[a + 8 >> 2] | 0;
                                                    b = f + 12 | 0;
                                                    d = e + 8 | 0;
                                                    if ((c[d >> 2] | 0) == (a | 0)) {
                                                        c[b >> 2] = e;
                                                        c[d >> 2] = f;
                                                        J = e;
                                                        break;
                                                    }
                                                }
                                            while (false);
                                            if (!(h != 0))
                                                break;
                                            b = c[a + 28 >> 2] | 0;
                                            d = 496 + (b << 2) | 0;
                                            do if ((a | 0) != (c[d >> 2] | 0)) {
                                                    b = h + 16 | 0;
                                                    if ((c[b >> 2] | 0) == (a | 0))
                                                        c[b >> 2] = J;
                                                    else
                                                        c[h + 20 >> 2] = J;
                                                    if (!(J != 0))
                                                        goto z;
                                                } else {
                                                    c[d >> 2] = J;
                                                    if ((J | 0) != 0)
                                                        break;
                                                    c[49] = c[49] & ~(1 << b);
                                                    goto z;
                                                }
                                            while (false);
                                            e = c[52] | 0;
                                            c[J + 24 >> 2] = h;
                                            b = a + 16 | 0;
                                            d = c[b >> 2] | 0;
                                            do if ((d | 0) != 0)
                                                    if (!((uint)(d & 0xffffffff) >> 0 < (uint)(e & 0xffffffff) >> 0)) {
                                                        c[J + 16 >> 2] = d;
                                                        c[d + 24 >> 2] = J;
                                                        break;
                                                    }
                                            while (false);
                                            b = c[b + 4 >> 2] | 0;
                                            if (!(b != 0))
                                                break;
                                            if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                                c[J + 20 >> 2] = b;
                                                c[b + 24 >> 2] = J;
                                                break;
                                            }
                                        } else {
                                            d = c[a + 8 >> 2] | 0;
                                            e = c[a + 12 >> 2] | 0;
                                            b = 232 + (f << 1 << 2) | 0;
                                            do if ((d | 0) != (b | 0)) {
                                                    if ((c[d + 12 >> 2] | 0) == (a | 0))
                                                        break;
                                                }
                                            while (false);
                                            if ((e | 0) == (d | 0)) {
                                                c[48] = c[48] & ~(1 << f);
                                                break;
                                            }
                                            do if ((e | 0) == (b | 0))
                                                    G = e + 8 | 0;
                                                else {
                                                    b = e + 8 | 0;
                                                    if ((c[b >> 2] | 0) == (a | 0)) {
                                                        G = b;
                                                        break;
                                                    }
                                                }
                                            while (false);
                                            c[d + 12 >> 2] = e;
                                            c[G >> 2] = d;
                                        }
                                    while (false);
                                    z:
                                    a = a + i | 0;
                                    g = i + g | 0;
                                }
                                a = a + 4 | 0;
                                c[a >> 2] = c[a >> 2] & -2;
                                c[k + 4 >> 2] = g | 1;
                                c[k + g >> 2] = g;
                                a = (uint)(g & 0xffffffff) >> 3;
                                if ((uint)(g & 0xffffffff) >> 0 < 256) {
                                    d = 232 + (a << 1 << 2) | 0;
                                    b = c[48] | 0;
                                    a = 1 << a;
                                    do if (!((b & a) != 0)) {
                                            c[48] = b | a;
                                            K = d + 8 | 0;
                                            L = d;
                                        } else {
                                            a = d + 8 | 0;
                                            b = c[a >> 2] | 0;
                                            if ((uint)(b & 0xffffffff) >> 0 >= (uint)((c[52] | 0) & 0xffffffff) >> 0) {
                                                K = a;
                                                L = b;
                                                break;
                                            }
                                        }
                                    while (false);
                                    c[K >> 2] = k;
                                    c[L + 12 >> 2] = k;
                                    c[k + 8 >> 2] = L;
                                    c[k + 12 >> 2] = d;
                                    break;
                                }
                                a = (uint)(g & 0xffffffff) >> 8;
                                do if (!(a != 0))
                                        d = 0;
                                    else {
                                        if ((uint)(g & 0xffffffff) >> 0 > 16777215) {
                                            d = 31;
                                            break;
                                        }
                                        K = (uint)((a + 1048320 | 0) & 0xffffffff) >> 16 & 8;
                                        L = a << K;
                                        J = (uint)((L + 520192 | 0) & 0xffffffff) >> 16 & 4;
                                        L = L << J;
                                        d = (uint)((L + 245760 | 0) & 0xffffffff) >> 16 & 2;
                                        d = 14 - (J | K | d) + (L << (uint)(d & 0xffffffff) >> 15) | 0;
                                        d = (uint)(g & 0xffffffff) >> (d + 7 | 0) & 1 | d << 1;
                                    }
                                while (false);
                                e = 496 + (d << 2) | 0;
                                c[k + 28 >> 2] = d;
                                a = k + 16 | 0;
                                c[a + 4 >> 2] = 0;
                                c[a >> 2] = 0;
                                a = c[49] | 0;
                                b = 1 << d;
                                if (!((a & b) != 0)) {
                                    c[49] = a | b;
                                    c[e >> 2] = k;
                                    c[k + 24 >> 2] = e;
                                    c[k + 12 >> 2] = k;
                                    c[k + 8 >> 2] = k;
                                    break;
                                }
                                f = g << ((d | 0) == 31 ? 0 : 25 - ((uint)(d & 0xffffffff) >> 1) | 0);
                                a = c[e >> 2] | 0;
                                while (true) {
                                    if ((c[a + 4 >> 2] & -8 | 0) == (g | 0)) {
                                        d = a;
                                        E = 281;
                                        break;
                                    }
                                    b = a + 16 + ((uint)(f & 0xffffffff) >> 31 << 2) | 0;
                                    d = c[b >> 2] | 0;
                                    if (!(d != 0)) {
                                        E = 278;
                                        break;
                                    } else {
                                        f = f << 1;
                                        a = d;
                                    }
                                }
                                if ((E | 0) == 278)
                                    if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                        c[b >> 2] = k;
                                        c[k + 24 >> 2] = a;
                                        c[k + 12 >> 2] = k;
                                        c[k + 8 >> 2] = k;
                                        break;
                                    } else if ((E | 0) == 281) {
                                        a = d + 8 | 0;
                                        b = c[a >> 2] | 0;
                                        L = c[52] | 0;
                                        if ((uint)(b & 0xffffffff) >> 0 >= (uint)(L & 0xffffffff) >> 0 && (uint)(d & 0xffffffff) >> 0 >= (uint)(L & 0xffffffff) >> 0) {
                                            c[b + 12 >> 2] = k;
                                            c[a >> 2] = k;
                                            c[k + 8 >> 2] = b;
                                            c[k + 12 >> 2] = d;
                                            c[k + 24 >> 2] = 0;
                                            break;
                                        }
                                    }
                            } else {
                                L = (c[51] | 0) + g | 0;
                                c[51] = L;
                                c[54] = k;
                                c[k + 4 >> 2] = L | 1;
                            }
                        while (false);
                        L = l + 8 | 0;
                        return L | 0;
                    } else
                        b = 640;
                while (true) {
                    a = c[b >> 2] | 0;
                    if ((uint)(a & 0xffffffff) >> 0 <= (uint)(i & 0xffffffff) >> 0) {
                        F = a + (c[b + 4 >> 2] | 0) | 0;
                    }
                    if ((uint)(a & 0xffffffff) >> 0 <= (uint)(i & 0xffffffff) >> 0 ? ( (uint)(F & 0xffffffff) >> 0 > (uint)(i & 0xffffffff) >> 0) : false) {
                        b = F;
                        break;
                    }
                    b = c[b + 8 >> 2] | 0;
                }
                g = b + -47 | 0;
                d = g + 8 | 0;
                d = g + ((d & 7 | 0) == 0 ? 0 : 0 - d & 7) | 0;
                g = i + 16 | 0;
                d = (uint)(d & 0xffffffff) >> 0 < (uint)(g & 0xffffffff) >> 0 ? i : d;
                a = d + 8 | 0;
                e = h + 8 | 0;
                e = (e & 7 | 0) == 0 ? 0 : 0 - e & 7;
                L = h + e | 0;
                e = f + -40 - e | 0;
                c[54] = L;
                c[51] = e;
                c[L + 4 >> 2] = e | 1;
                c[L + e + 4 >> 2] = 40;
                c[55] = c[170];
                e = d + 4 | 0;
                c[e >> 2] = 27;
                c[a >> 2] = c[160];
                c[a + 4 >> 2] = c[161];
                c[a + 8 >> 2] = c[162];
                c[a + 12 >> 2] = c[163];
                c[160] = h;
                c[161] = f;
                c[163] = 0;
                c[162] = a;
                a = d + 24 | 0;
                do {
                    a = a + 4 | 0;
                    c[a >> 2] = 7;
                } while ((uint)((a + 4 | 0) & 0xffffffff) >> 0 < (uint)(b & 0xffffffff) >> 0);
                if ((d | 0) != (i | 0)) {
                    h = d - i | 0;
                    c[e >> 2] = c[e >> 2] & -2;
                    c[i + 4 >> 2] = h | 1;
                    c[d >> 2] = h;
                    a = (uint)(h & 0xffffffff) >> 3;
                    if ((uint)(h & 0xffffffff) >> 0 < 256) {
                        d = 232 + (a << 1 << 2) | 0;
                        b = c[48] | 0;
                        a = 1 << a;
                        if ((b & a) != 0) {
                            a = d + 8 | 0;
                            b = c[a >> 2] | 0;
                            if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                                H = a;
                                I = b;
                            }
                        } else {
                            c[48] = b | a;
                            H = d + 8 | 0;
                            I = d;
                        }
                        c[H >> 2] = i;
                        c[I + 12 >> 2] = i;
                        c[i + 8 >> 2] = I;
                        c[i + 12 >> 2] = d;
                        break;
                    }
                    a = (uint)(h & 0xffffffff) >> 8;
                    if (a != 0)
                        if ((uint)(h & 0xffffffff) >> 0 > 16777215)
                            d = 31;
                        else {
                            K = (uint)((a + 1048320 | 0) & 0xffffffff) >> 16 & 8;
                            L = a << K;
                            J = (uint)((L + 520192 | 0) & 0xffffffff) >> 16 & 4;
                            L = L << J;
                            d = (uint)((L + 245760 | 0) & 0xffffffff) >> 16 & 2;
                            d = 14 - (J | K | d) + (L << (uint)(d & 0xffffffff) >> 15) | 0;
                            d = (uint)(h & 0xffffffff) >> (d + 7 | 0) & 1 | d << 1;
                        }
                    else
                        d = 0;
                    f = 496 + (d << 2) | 0;
                    c[i + 28 >> 2] = d;
                    c[i + 20 >> 2] = 0;
                    c[g >> 2] = 0;
                    a = c[49] | 0;
                    b = 1 << d;
                    if (!((a & b) != 0)) {
                        c[49] = a | b;
                        c[f >> 2] = i;
                        c[i + 24 >> 2] = f;
                        c[i + 12 >> 2] = i;
                        c[i + 8 >> 2] = i;
                        break;
                    }
                    e = h << ((d | 0) == 31 ? 0 : 25 - ((uint)(d & 0xffffffff) >> 1) | 0);
                    a = c[f >> 2] | 0;
                    while (true) {
                        if ((c[a + 4 >> 2] & -8 | 0) == (h | 0)) {
                            d = a;
                            E = 307;
                            break;
                        }
                        b = a + 16 + ((uint)(e & 0xffffffff) >> 31 << 2) | 0;
                        d = c[b >> 2] | 0;
                        if (!(d != 0)) {
                            E = 304;
                            break;
                        } else {
                            e = e << 1;
                            a = d;
                        }
                    }
                    if ((E | 0) == 304)
                        if (!((uint)(b & 0xffffffff) >> 0 < (uint)((c[52] | 0) & 0xffffffff) >> 0)) {
                            c[b >> 2] = i;
                            c[i + 24 >> 2] = a;
                            c[i + 12 >> 2] = i;
                            c[i + 8 >> 2] = i;
                            break;
                        } else if ((E | 0) == 307) {
                            a = d + 8 | 0;
                            b = c[a >> 2] | 0;
                            L = c[52] | 0;
                            if ((uint)(b & 0xffffffff) >> 0 >= (uint)(L & 0xffffffff) >> 0 && (uint)(d & 0xffffffff) >> 0 >= (uint)(L & 0xffffffff) >> 0) {
                                c[b + 12 >> 2] = i;
                                c[a >> 2] = i;
                                c[i + 8 >> 2] = b;
                                c[i + 12 >> 2] = d;
                                c[i + 24 >> 2] = 0;
                                break;
                            }
                        }
                }
            } else {
                L = c[52] | 0;
                if ((L | 0) == 0 || (uint)(h & 0xffffffff) >> 0 < (uint)(L & 0xffffffff) >> 0)
                    c[52] = h;
                c[160] = h;
                c[161] = f;
                c[163] = 0;
                c[57] = c[166];
                c[56] = -1;
                a = 0;
                do {
                    L = 232 + (a << 1 << 2) | 0;
                    c[L + 12 >> 2] = L;
                    c[L + 8 >> 2] = L;
                    a = a + 1 | 0;
                } while ((a | 0) != 32);
                L = h + 8 | 0;
                L = (L & 7 | 0) == 0 ? 0 : 0 - L & 7;
                K = h + L | 0;
                L = f + -40 - L | 0;
                c[54] = K;
                c[51] = L;
                c[K + 4 >> 2] = L | 1;
                c[K + L + 4 >> 2] = 40;
                c[55] = c[170];
            }
        while (false);
        a = c[51] | 0;
        if ((uint)(a & 0xffffffff) >> 0 > (uint)(o & 0xffffffff) >> 0) {
            J = a - o | 0;
            c[51] = J;
            L = c[54] | 0;
            K = L + o | 0;
            c[54] = K;
            c[K + 4 >> 2] = J | 1;
            c[L + 4 >> 2] = o | 3;
            L = L + 8 | 0;
            return L | 0;
        }
    }
    return 0;
}

@end
