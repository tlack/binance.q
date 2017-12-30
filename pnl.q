BTC:13000;
\c 5 999
show trades:("ZssfffS";enlist",")0:`t0.csv;
show trades2:update tot:neg tot,qty:neg qty from
  (`dt xasc select dt,act,px,qty,tot from trades where sym=`XVGBTC)
  where act=`BUY;

\c 99999 999
show pnl:update profitusd:BTC*profit from
    update profit:deltas pnl,pnlusd:pnl*BTC
      from select px:avg px,move:sum qty,pnl:sum tot by
        1 xbar dt.minute from trades2;
