/ analyze profit and loss from binance trade history documents
/ to use, download xls file from binance, export as CSV however (google sheets)
/ then run:
/ $ q pnl.q trades20171230.csv

\l _CONF.q
\l _lib.q

\c 5

show trades:
	update tot:neg tot, qty:neg qty from
		(`dt xasc select dt:Date,sym:Market,act:Type,px:Price,qty:Amount,tot:neg Total,fee:Fee
		 from ("ZssfffS";enlist",")0:`$":",.z.x[0]) where act=`SELL;

\c 999

/ show stats for all syms

show select ntrades:count qty, tot:BTC*sum(tot), remaining:sum(qty) by sym from trades;

/ show PNL from a given sym 

show pnl:update profitusd:BTC*profit from update profit:deltas[first pnl;pnl],pnlusd:pnl*BTC from select px:px,qtychg:qty,pnl:tot from trades where sym=`XLMBTC;

/
exit 1;

show trades2:update tot:neg tot,qty:neg qty from
  (`dt xasc select dt,act,px,qty,tot from trades where sym in syms)
  where act=`BUY;

\c 99999 999
show pnl:update profitusd:BTC*profit from update profit:deltas pnl,pnlusd:pnl*BTC from select px:avg px,move:sum qty,pnl:sum tot by 1 xbar dt.minute from trades;
