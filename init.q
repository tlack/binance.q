/ create databases

/ my orders:

Fills:([] dt:`datetime$(); sym:`symbol$(); dir:`symbol$();
	px:`float$(); qty:`float$(); tot:`float$();
	fee:`float$(); fsym:`symbol$() )
save `Fills

Trades:([id:`int$()]
	dt:`datetime$(); sym:`symbol$(); px:`float$(); qty:`float$() )
save `Trades


/
Quotes:([]
	dt:`datetime$(); sym:`symbol$(); 

q)meta AllTrades
c           | t f a
------------| -----
id          | f
price       | f
qty         | f
time        | z
isBuyerMaker| b
isBestMatch | b
