
## Lining.js
Based on lettering.js, lining.js wraps lines of text in a `<span>`. This is based on the lines of text as they are rendered *when .lining() is called*.  If the viewport is resized, or the font size changes, or anything else happens to the page that causes the text to change position, the line wrappings will no longer be correct. However, you can use event handlers for these types of changes (resize, orientationchange, etc.) to call the `.lining("unline")` method to unwrap lining spans, then re-wrap with `.lining()`.

Keep in mind that this plugin will treat "words" with breaking characters (dashes, etc.) not separated by spaces as a single word. This can screw up line endings, so for best results use nonbreaking versions or use spaces around breaking characters.
