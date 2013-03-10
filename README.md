matgraph
========

A toolbox of functions to simplify altering an existing figure. It is particularly useful in situations where a figure may be saved in a figure file or generated from code that is saved in a figure file, so it is difficult or impossible to access the code that generated the original graph.

installation
========
Download the code and unzip it. Then add the path with the folder to your matlab path: http://www.mathworks.com/help/matlab/ref/addpath.html.

use
========
We are assuming that you have a figure with potentially many subplots, and that the figure you want to work with is the one that's "current", ie the one returned by the gcf command. You can change which figure is current by clicking on it before running the script. Axes in the plot are numbered across first and then down, as so:

| 1 | 2 | 3 |

| 4 | 5 | 6 |

| 7 | 8 | 9 |

Typically the functions take the axis number as their first argument. 
