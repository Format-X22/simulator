chronicler = require './chronicler'
log = chronicler.log

exports.getMoney = (next) ->
	log 'Состояние денег'
	#

exports.getOrder = (next) ->
	log 'Текущий ордер'
	#

exports.getGlass = (next) ->
	log 'Стакан'
	#

exports.isSupported = (glass, order, next) ->
	log 'Проверка поддержки'
	#

exports.getGoodPositions = (glass, next) ->
	log 'Хорошие позиции'
	#

exports.remove = (next) ->
	log 'Удаление ордера'
	#

exports.set = (target, next) ->
	log 'Установка ордера'
	#