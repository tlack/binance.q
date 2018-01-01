/ library routines
Syms:" "vs SYMS;
F:{.Q.fmt[12;9;]x}
FS:{$[0<=type x; FS each x; F[x*SAT],"S"]}
FB:{$[0<=type x; FB each x; F[x*BTC],"$"]}
curl:{0N! ""sv system 0N! CURL," '",x,"' >>logs/curl.log 2>&1"};
sleep:{system "sleep ",string x+first 1?x};
api:{.j.k curl API[x],y};
btcaddr:{api['BC,"rawaddr/",string x]}
tgpost:{[ch;msg] api[`TG,"sendMessage?chat_id=",string[ch],"&text=",.h.hu[msg]]}




