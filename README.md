jquery-bulb
===========

Slice/split DOM. Decouple element from stream. Use at your own risk!
jQuery plugin for DOM splitting. Useful when content is received from WYSIWYG editor.

## Usage
```js
	$(elements).bulb(selector, parent)
```
Where ```selector``` – a CSS selector, we bulbing to, and ```parent``` – give false if you want to keep elements inside.

## Example
For example, you have that DOM (jade code):
```jade
	article.wrap
		h1 Article header
		p A copy 1
		p A copy 2
		h2 Subheader 1
		p A copy 3
		p A copy 4
		h2 Subheader 2
		p A copy 5
```
And you want to transform it to:
```jade
	h1 Article header
	article.wrap
		p A copy 1
		p A copy 2
	h2 Subheader 1
	article.wrap
		p A copy 3
		p A copy 4
	h2 Subheader 2
	article.wrap
		p A copy 5
```
Then you could do
```js
	$("h1, h2").bulb("article.wrap")
```
This means "bulb headings outside of article".

See a demo at example.html.
