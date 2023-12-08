# ex_checkbox_tree
Example showing how you can emulate an INPUT ARRAY to a TREE  if it is only CHECKBOXs you want

Since TREE container was added to Genero, a restriction has been that the TREE container can only be used with DISPLAY ARRAY.  It has not been possible to use a TREE container with an INPUT ARRAY.  The reasoning behind this is that the user could potentially alter the tree structure by editing parentid and id columns as well as adding and deleting nodes.

A common GUI design pattern is to have a TREE where you want the user to check or uncheck rows, and so the developers first instinct is to use a TREE container with an INPUT ARRAY with a column that contains a CHECKBOX.  As INPUT ARRAY and TREE is not allowed, the developer is stymied.   Once technique around this is to use DISPLAY ARRAY to TREE which is allowed and instead of a CHECKBOX, have an IMAGE column that renders a checked or unchecked, and an ACTION attribute defined for this IMAGE widget.  Behind the action is code so that when the IMAGE is clicked, the IMAGE toggles between the checked and unchecked checkbox image. 

![Screen Shot 2023-12-08 at 1 38 39 PM](https://github.com/FourjsGenero/ex_checkbox_tree/assets/13615993/6d05751d-a4f0-4eb5-93f7-e6d04cb14e78)
