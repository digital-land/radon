Demonstration of hosting the [British Geological Survey (BGS)](https://www.bgs.ac.uk/) [radon indicitive atlas](https://www.bgs.ac.uk/download/radon-potential-indicative-atlas-data-for-great-britain/) as vector tiles on GitHub pages.

> The Radon potential dataset provides the current definitive map of radon-affected areas in Great Britain and Northern Ireland. This data presents a simplified version of the radon potential dataset with each 1 km-grid square being classed according to the highest radon potential found within it, so is indicative rather than definitive. For more information and to licence or access free versions of the data please visit our Radon potential webpage.

# Rebuilding the data

Converting the ESRI Shapefile to GeoJSON uses GDAL:

    $ sudo apt-get install gdal-bin

Translating the JSON uses the [jq](https://jqlang.org/) command:

    $ sudo apt-get install jq

Rebuilding the vector tiles uses the MapBox [tippecanoe](https://github.com/mapbox/tippecanoe) command:

    $ sudo apt-get install tippecanoe

We recommend working in [virtual environment](http://docs.python-guide.org/en/latest/dev/virtualenvs/) before installing the python [requirements](requirements.txt).

    $ make init
    $ make

# Licence

The software in this project is open source and covered by the [LICENSE](LICENSE) file.

The radon indicative atlas dataset is used under the terms of the [Open Government 3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence which [Contains British Geological Survey materials © UKRI 2021](https://www.bgs.ac.uk/bgs-intellectual-property-rights/open-government-licence/).

Other individual datasets copied into this repository may have specific copyright and licensing, otherwise all content and data in this repository is
[© Crown copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/)
and available under the terms of the [Open Government 3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence.
