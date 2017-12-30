/ run the telegram bot
\l _CONF.q
\l _lib.q

{ cid:(m[`chat])`id,f:(m:(x[`message]))[`from]); `:msgs/ upsert ([] id:m@'id; chat:cid; f:f; m:m) }each(api[`TG;"getUpdates?offset=0"])[`result]



