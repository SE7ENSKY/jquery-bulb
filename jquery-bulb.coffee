###
@name jquery-bulb
@description Slice/split DOM. Decouple element from stream. Use at your own risk!
@version 0.0.1
@author Se7enSky studio <info@se7ensky.com>
###

###! jquery-bulb 0.0.1 http://github.com/Se7enSky/jquery-bulb###

plugin = ($) ->

	"use strict"

	bulb = ($el) ->
		$parent = $el.parent()
		$parentClone = $parent.clone().empty()
		$el.nextAll().appendTo $parentClone
		$parentClone.insertAfter $parent
		$el.insertAfter $parent
		$parent.remove() if $parent.children().length is 0

	$.fn.bulb = (selector, parent = yes) ->
		@each ->
			if selector
				bulb $(@) while not $(@).parent().is selector
			bulb $(@) if parent
		@

# UMD
if typeof define is 'function' and define.amd # AMD
	define(['jquery'], plugin)
else # browser globals
	plugin(jQuery)