# Generic-Mapping-Tools-GMT
 Inspirations for creating maps using GMT
 
 # Personal comment
Learning how to use this tool is not so simple, the level of difficulty for those who are starting can be very difficult, however after understanding how the tool works it will be easier in creating other projects. I customary to say that the less friendly a programming tool is, the more powerful it is. GMT is one of them. Take advantage of this repository and good studies.
 
 # GRDCUT
 ## lines 17 and 51;
 ### This command cuts the topography for a desired region, then you name it with;
 #### [For more information click here](http://gmt.soest.hawaii.edu/doc/latest/datasets.html)
 
 # GRDIMAGE
 ## lines 19 and 53;
 ### This is command apply the topography cut of grdcut on the map;
 #### [For more information click here](http://gmt.soest.hawaii.edu/doc/5.3.2/grdimage.html)
 
 # PSCOAST
 ## lines 21 and 55;
 ### In line 21 we apply a type of north on the map, however there are other types, in addition we specify which type of source we want to show in the representations of the directions;
 ### In line 55 we apply only the division of countries with the parameter -N, in the globe;
 #### [for more information about PSCOAST click here](http://gmt.soest.hawaii.edu/doc/5.3.2/pscoast.html)
 #### [font types](https://github.com/LessandroValente/Generic-Mapping-Tools--GMT/blob/master/font%20types.png)
 
 # PSBASEMAP
 ## lines 23 and 25;
 this command has many uses, as well as the others described previously
 ### line 23, Scaling the map with the -L parameter;
 ### line 25, Applying the title with the -B parameter with a font type in the letters;
 #### [For more information click here](http://gmt.soest.hawaii.edu/doc/5.3.2/psbasemap.html)
 
# MAKECPT
## line 28;
### This command creates a new color palette based on an 'old' palette, in our case RAINBOW, specifying the minimum and maximum limits with the -T parameter. In addition, we named it again, in our case, seis.cpt. You can choose another name, feel free;
#### [For more information click here](http://gmt.soest.hawaii.edu/doc/5.3.2/makecpt.html)
#### images of the palettes created by GMT are can be consulted in the repository.

# AWK
## line 30;
### This is a tool that is not part of GMT, but is used in the creation of this map for loading seismic events and later for plotting. I suggest you take a look at Matthew Herman's guide for better understanding;
#### [Guide Matthew Herman](https://www.matthewwherman.com/tutorials.html)

# PSSCALE
## line 32;
### This command plots a color scale to represent the depth of the earthquakes;
#### [For more information click here](http://gmt.soest.hawaii.edu/doc/5.3.2/psscale.html)

# PSTEXT
## line 57;
### We use this command to plot text, in our case we plot the word BRAZIL on the globe;
#### [For more information click here](http://gmt.soest.hawaii.edu/doc/5.3.2/pstext.html)

# PSCONVERT
## line 63;
### convert your PostScript (ps) file to other formats, such as PDF, PNG, etc;
#### [For more information click here](http://gmt.soest.hawaii.edu/doc/5.3.2/psconvert.html)

# EVINCE
## shows your PostScript file, to view a jpeg or png file, use eog instead of evince.

