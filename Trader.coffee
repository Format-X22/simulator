broker = require './broker'
analyst = require './analyst'

trade = () ->
	broker.clean()
	broker.getOrder (order) ->
		if order
			isNoSupport -> setOrderIfGoodPosition()
		else
			setOrderIfGoodPosition()

isNoSupport = (next) ->
	analyst.getSupport (support) ->
		unless support then next()

setOrderIfGoodPosition = () ->
	analyst.getGoodPosition (good) ->
		if good then broker.setOrder()

trade()
setInterval trade, 60 * 1000