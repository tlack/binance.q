/ ingest trades file into Trades table
\c 10 9999
load `AllTrades;
show count AllTrades;
trades:`id xkey update price:"F"$price,qty:"F"$qty,time:"Z"$_[-1;]each .Q.f[0;]each time%1000 from .j.k get `$":",.z.x 0
show count trades;
`AllTrades upsert trades
show count AllTrades
save `AllTrades
exit 0

