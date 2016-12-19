# An exhibit of Markdown


This note demonstrates some of what [Markdown][1] is capable of 
doing
so.


*Note: Feel free to play with this page. Unlike regular notes, this doesn't automatically save itself.*

## Basic formatting

Paragraphs can be written like so. A paragraph is the basic block of Markdown. A paragraph is what text will turn into when there is no reason it should become anything else.

Paragraphs must be separated by a blank line. Basic formatting of *italics*, **bold**, ~~del~~ is supported. This _can ~~be~~ __nested__ like_ so.

## Lists

### Ordered list

1. Item 1
2. A second item
3. Number 3
4. Ⅳ

*Note: the fourth item uses the Unicode character for [Roman numeral four][2].*

### Unordered list

* An item
+ Another item
- Yet another item
* And there's more...

## Paragraph modifiers

### Code block

```
Code blocks are very useful for developers and other people who look at code or other things that are written in plain text. As you can see, it uses a fixed-width font.
123
```

You can also make `inline code` to add code into other things.

### Quote

> Here is a quote. What this is should be self explanatory. 
Quotes are automatically indented when they are used.
* A named link to [MarkItDown][3]. The easiest way to do these is to select what you want to make a link and hit `Ctrl+L`.
* Another named link to [MarkItDown](http://markitdown.net/)
* Sometimes you just want a URL like <http://www.markitdown.net/>.

## Headings

There are six levels of headings. They correspond with the six levels of HTML headings. You've probably noticed them already in the page. Each level down uses one more hash character.

### Headings *can* also contain **formatting**

### They can even contain `inline code`

Of course, demonstrating what headings look like messes up the structure of the page.

I don't recommend using more than three or four levels of headings here, because, when you're smallest heading isn't too small, and you're largest heading isn't too big, and you want each size up to look noticeably larger and more important, there there are only so many sizes that you can use.

## URLs

URLs can be made in a handful of ways:

* A named link to [MarkItDown][3]. The easiest way to do these is to select what you want to make a link and hit `Ctrl+L`.
* Another named link to [MarkItDown](http://markitdown.net/)
* Sometimes you just want a URL like <http://www.markitdown.net/>.

## Horizontal rule

A horizontal rule is a line that goes across the middle of the page.

---

It's sometimes handy for breaking things up.

## Images

Markdown can also contain images.  
![Image](https://s-media-cache-ak0.pinimg.com/736x/5b/a7/a1/5ba7a1c9d1200a43a4bd9c76bb76568a.jpg)  
![Logo][logo]

## Escaping

Symbols can also be escaped with \\:  
\*italic\*, \*\*bold\*\*, \~\~del\~\~, \`code\`, \[link](example.com), \<example.com>, \![link][logo] and so on

## Finally

There's actually a lot more to Markdown than this. See the official [introduction][4] and [syntax][5] for more information. However, be aware that this is not using the official implementation, and this might work subtly differently in some of the little things.


  [1]: http://daringfireball.net/projects/markdown/
  [2]: http://www.fileformat.info/info/unicode/char/2163/index.html
  [3]: http://www.markitdown.net/
  [4]: http://daringfireball.net/projects/markdown/basics
  [5]: http://daringfireball.net/projects/markdown/syntax
  [logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png