/ fetch trades from binance

\l _CONF.q
\l _lib.q

load `Trades;
show ("Trades size=";count Trades);

symfn:{`$":data/",x,"-",ssr[string[.z.P],".json";":";"."]};
ingest:{
	a:update sym:(count price)#x,price:"F"$price,qty:"F"$qty,dt:"Z"$_[-1;] 
			each .Q.f[0;] each time%1000 from y;
	show ("a";a);

	trades: 0N!`id xkey select px:price from 
		delete isBuyerMaker,isBestMatch from 
		a;
	show ("trades";trades);

	show meta trades;
	show meta Trades;

	`Trades upsert trades;
	show Trades;

	y }

gettr:{show fn:symfn[x]; sleep[0.4]; fn set .j.j ingest[x;] api[`BN;"trades?symbol=",x]};

gettr each Syms; 

show ("Trades new size=";count Trades)
save `Trades


