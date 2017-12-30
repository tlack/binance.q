/ library routines
curl:{0N! ""sv system 0N! CURL," '",x,"' >>logs/curl.log 2>&1"};
sleep:{system "sleep ",string x+first 1?x};
api:{.j.k curl API[x],y};
btcaddr:{api['BC,"rawaddr/",string x]}




