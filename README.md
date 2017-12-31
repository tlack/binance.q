# binance.q

## wut is

These are helpful tools for those who use Binance.com for cryptocurrency trading.

They are written in the Q language by Arthur Whitney and KX Systems.

## parts

* fetch.q - endless loop. download trades for watched symbols. store in data/

* pnl.q - using your downloaded trade history, attempt to build a profit and loss statement for every active trading period of the day, and builds a trade table for you

* ranges.q - not yet implemented. stats for a given set of trades.

* bot.q - not yet implemented. telegram bot to send you alerts when ranges reach certain levels.

## usage

1. Install the latest Q/Kdb from [KX Systems](http://www.kx.com/)

2. Setup config:
```
$ cp _CONF.EXAMPLE.q _CONF.q
$ vim _CONF.q
$ mkdir data/ logs/
$ q fetch.q
# etc..
```

## disclaimer

i have no idea what im doing as usual

## who

lackner@gmail.com

## license

none



