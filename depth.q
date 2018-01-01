\l _CONF.q
\l _lib.q
depth:0N!api[`BN;"depth?symbol=XVGBTC"]

askbook:update px:"F"$px,qty:"F"$qty from flip `px`qty`z!flip depth`asks
bidbook:update px:"F"$px,qty:"F"$qty from flip `px`qty`z!flip depth`bids


