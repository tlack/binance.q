/ fetchbot: retrieve trades and send alerts all in one

\l _CONF.q
\l _lib.q

load `Trades;
show ("Trades size=";count Trades);

symfn:{`$":data/",string[x],"-",ssr[string[.z.P],".json";":";"."]};
ingest:{
	a:update id:"i"$id, sym:x,price:"F"$price,qty:"F"$qty,dt:"Z"$_[-1;] 
			each .Q.f[0;] each time%1000 from y;
	trades: 0N!`id xkey 
		delete time,price,isBuyerMaker,isBestMatch from 
		update px:price from a;
	`Trades upsert trades;
	y }
gettr:{show fn:symfn[x]; sleep[CURLDLY]; fn set .j.j ingest[x;] api[`BN;"trades?symbol=",string x]};
gettr each Syms; 
show ("Trades new size=";count Trades)
save `Trades
lbl:{","sv{raze string[x],": ",$[9=type y[x];FS y[x];string each y[x]]}[;x] each key first x}
stats:{lpx:exec last px from Trades where sym=x;
	r:exec vol:sum qty,lastpx:lpx,lopx:min px,hipx:max px from (-1000#Trades) where sym=x;
	"SCORE CARD (1000 trades)\nUSD:",FB[lpx]," / VOL:",.Q.f[2;r[`vol]%1000],"K / LAST:",FS[lpx],
	" / LO:",FS[r[`lopx]]," HI:",FS[r[`hipx]]
	}
last20:{lpx:exec last px from Trades where sym=x;
	last10:exec ", "sv .Q.f[3;] each reverse ratios[lpx;-20#px] from (-1000#Trades) where sym=x;
	"PX RATIOS (last 20 latest first)\n",last10
	}
wa1:{r:select pxavg:avg px,pxmin:min px,pxmax:max px,
		ma1t3:last 1 mavg (-3#px),ma3t10:last 3 mavg (-10#px),ma10t100:last 10 mavg (-100#px)
	from -250 # select from Trades where sym=x;
	"WAVG (last 250)\n",lbl r};
anal:{string[x]," ->\n","\n"sv(stats[x];last20[x];wa1[x])} 
tgpost[TGCHAT;"\n\n" sv anal each Syms]
exit 1

/
wa1:{[sym,t] select 1 wavg (-3#t), 2 wavg (-8#t), 3 wavg (-50#t) from t}
anal:{wa1[x] -1000 # select from `Trades where sym=x}
anal[`POEBTC]



