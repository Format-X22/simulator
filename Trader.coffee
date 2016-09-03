broker = require './broker'
waitTime = 10 * 1000

order = null
supported = false
good = false
glass = []
usd = 0
btc = 0

trade = () ->
	getState -> getAnalytics -> doResolution -> wait -> trade()

getState = (next) ->
	getMoney -> getOrder -> getGlass -> next()

getMoney = (next) ->
	broker.getMoney (money) ->
		{usd, btc} = money
		next()

getOrder = (next) ->
	broker.getOrder (result) ->
		order = result
		next()

getGlass = (next) ->
	broker.getGlass (result) ->
		glass = result
		next()

getAnalytics = (next) ->
	getPositionSupported -> getGoodPositions -> next()

getPositionSupported = (next) ->
	if order
		supported = false
		return

	broker.isSupported glass, order, next

getGoodPositions = (next) ->
	broker.getGoodPositions glass, (positions) ->
		good = positions
		next()

doResolution = (next) ->
	switch
		when order and not supported and good
			replace -> next()
		when not order and good
			set -> next()

replace = (next) ->
	broker.remove -> set -> next()

set = (next) ->
	switch
		when btc and good.sell
			broker.set good.sell, next
		when usd and good.buy
			broker.set good.buy, next

wait = (next) ->
	setTimeout next, waitTime

trade()