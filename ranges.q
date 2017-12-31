/ ranges - show ranges from a set of trades
/ use like q ranges.q 
\c 10 9999
trades:update price:"F"$price,qty:"F"$qty,time:"Z"$_[-1;]each .Q.f[0;]each time%1000 from .j.k get `$":",.z.x 0
show trades


