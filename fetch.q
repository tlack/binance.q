/ fetch trades from binance

\l _CONF.q
\l _lib.q

syms:" "vs SYMS;
symfn:{`$":data/",x,"-",ssr[string[.z.P],".json";":";"."]};
gettr:{show fn:symfn[x]; sleep[0.3]; fn set .j.j api[`BN;"trades?symbol=",x]};
fetch:{gettr each syms; fetch[]};
fetch[]


