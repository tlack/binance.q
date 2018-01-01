/ run the telegram bot
\l _CONF.q
\l _lib.q

parsemsg:{ 
	show x;
	msg:$[1b~`message in key x;x`message;:`nomsg];
	show msg;
	cid:$[1b~`chat in key msg;"i"$msg[`chat]`id;:`nocid];
	show "CID= ", string cid;
	f:$[1b~`from in x;x`from;`nofrom];
	(cid;f;msg)}
parsemsg each (api[`TG;"getUpdates"])[`result]



