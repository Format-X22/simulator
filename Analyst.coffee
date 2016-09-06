broker = require './broker'

exports.getSupport = (next) ->
	getInfo (order, glass, money, last) ->
		#

exports.getGoodPosition = (next) ->
	getInfo (order, glass, money, last) ->
		#

getInfo = (next) ->
	broker.getOrder (order) ->
		broker.getGlass (glass) ->
			broker.getMoney (money) ->
				broker.getLastOrder (last) ->
					next order, glass, money, last