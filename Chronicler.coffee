io = require('jsonfile')
io.spaces = 4
storage = './storage.json'
merge = require('merge')

exports.nonce = () ->
	nonce = read().nonce

	write {
		nonce: ++nonce
	}

	nonce

exports.log = (message) ->
	data = read()
	data.log.push message
	write data

	console.log message

exports.error = (message) ->
	message = "[ERROR] #{message}"
	
read = () ->
	io.readFileSync storage

write = (data) ->
	data = merge.recursive read(), data
	io.writeFileSync storage, data