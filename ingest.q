/ fetch trades from binance

\l _CONF.q
\l _lib.q

load `AllTrades;
show ("AllTrades size=";count AllTrades);
syms:" "vs SYMS;
symfn:{`$":data/",x,"-",ssr[string[.z.P],".json";":";"."]};
ingest:{ trades:`id xkey select px:price from update price:"F"$price,qty:"F"$qty,time:"Z"$_[-1;] 
	each .Q.f[0;] each time%1000 from x;
	`AllTrades upsert trades;
	x }

gettr:{show fn:symfn[x]; sleep[0.4]; fn set .j.j ingest api[`BN;"trades?symbol=",x]};

gettr each syms; 

show ("AllTrades new size=";count AllTrades)
save `AllTrades


