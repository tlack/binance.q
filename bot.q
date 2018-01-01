/ run the telegram bot
\l _CONF.q
\l _lib.q

{ msg:x`message; cid: (m[`chat])`id; f:x`from;
  show (sg;cid;f); } each (api[`TG;"getUpdates"])[`result]



