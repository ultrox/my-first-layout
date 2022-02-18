### Expectation

I don't think I'll have major problems here with this layout, only thing that could be tricky:

- hamburger menu on mobile
- tabs for roadmaps


## Preparation

Few stuff I needed to adjust before starting, mainly smaller things in designs:

- Normaized colors in HSL format
	Some colors had very similar hue but few degree difference that eye coulding see (my eye at least)
- Icons: I just found all the icons accross the mockup and adjusted them to fit
	on 20x20 frame & small adjustment of actuall icons size so it's easier to work with them.



## Questions and Problems

### Type scale
* I don't have intuition about typo or/and scale at all, very visible when I was setting up typographi and size for it.

* I know I have 7 scales starting from p, h6..h1 I had a problem
That The scale didn't really fit the design

* What would be best aproach here?
Do I go and make the scale fit, or do I get the best 
I can and then override?
Good examples are those titles that are the same size(but bold) as p text


### Sidenav
Looking at design, sidenav needs to be below header, which immediatelly
complicates both header and side nav since height now needs to be recalculated.

- I would challange this design with designer if this was real project and make
	the sidebar full height by explaining my arguments which I successfully did
	many times, and people(designers) are typically very open to tune their
	designs if you come with good argumentations
- This would help tame trickery that needs to be done here


There is 2 options I see:

### Option 1 (math)
- Make the header fixed size in css variable
- Make the sidebar `height: calc(100% - var(--header-height))`


## Option 2 (trick)
- Second trick is to simplify sidebar height by making it 100%
This will overflow parent even if sidebar content is not larger (this anoyes me), but to work around that, 
I can go `overflow: hidden` on body itself

Question is here how to deal with padding in most optimal way, so my header don't overflow in strange way
https://medium.com/coding-blocks/css-padding-a-magic-wand-2b8a66b84ebe



### Questions
- If I use title on a elements do I need aria-label, this is for links that
	have not children as text, but icons?


### Live preview
https://layout-no2.netlify.app/
