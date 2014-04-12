NB. From 'Learning J', chapter 25
NB. See also http://www.jsoftware.com/help/user/lib_colib.htm

NB. CLASS Stack
NB. Create class and make Stack locale current
coclass 'Stack'

NB. Constructor (name must be 'create'), 'items' is an instance field
create=: verb def 'items=: 0$0'

NB. Methods
push=: verb def '# items=: (< y) , items'
top=: verb def '> {. items'
pop=: verb def '# items=: }. items'

NB. Destructor (use the one provided in the standard library)
destroy=: codestroy
NB. END CLASS Stack

NB. Switch back to the base locale
cocurrent 'base'


NB. USAGE

NB. Create a new Stack (actually a new [numbered] locale)
S=: '' conew 'Stack'  NB. Same as:  create__S '' [ S=: conew 'Stack'

NB. Use it
push__S 'what'
push__S 'is all'
push__S 'this?'
top__S ''  NB. => this?
pop__S ''

NB. Destroy it
destroy__S ''
