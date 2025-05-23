# downloaded data from other sources
CACHE_DIR=var/cache/
RADON_POTENTIAL=dataset/radon-potential.geojson
LAYERS=\
	   $(RADON_POTENTIAL)

tiles: $(LAYERS)
	rm -rf $@
	tippecanoe -Z6 -z14 --no-tile-compression --output-to-directory=tiles/ \
		-L radon-potential:$(RADON_POTENTIAL)

dataset/radon-potential.geojson: $(CACHE_DIR)radon-potential.geojson
	@mkdir -p $(dir $@)
	jq -c '.features[].properties |= (."reference"=.TILE | ."radon-potential-class"=.CLASS_MAX | del(.TILE, .VERSION, .CLASS_MAX)) | del(.crs, .name)' $^ > $@

$(CACHE_DIR)radon-potential.geojson: $(CACHE_DIR)radon-potential.zip
	@mkdir -p $(dir $@)
	ogr2ogr $@ /vsizip/$^/Radon_Indicative_Atlas_v3.shp -t_srs EPSG:4326 -s_srs EPSG:27700 -lco COORDINATE_PRECISION=5

$(CACHE_DIR)radon-potential.zip:
	@mkdir -p $(dir $@)
	curl -qfsL 'https://www.bgs.ac.uk/download/radon-potential-indicative-atlas-data-for-great-britain/?wpdmdl=11858' > $@

init::
	pip install -r requirements.txt

clobber::
	rm -rf tiles/ $(LAYERS)

clean::
	rm -rf var/

