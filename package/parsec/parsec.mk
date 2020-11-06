PARSEC_VERSION = 3.0
PARSEC_SITE = /work/marie/parsec-3.0
PARSEC_SITE_METHOD = local
PARSEC_BUILDROOT_PATH = /work/marie/buildroot/package/parsec
PARSEC_BIN = \
	barnes \
	blackscholes \
	bodytrack \
	cass_add_cfg \
	cass_add_index \
	cass_add_map \
	cass_add_table \
	cass_add_vec_dist \
	cass_add_vecset_dist \
	cass_describe \
	cass_export \
	cass_import \
	cass_init \
	cholesky \
	cjpeg \
	djpeg \
	ferret \
	fft \
	fluidanimate \
	fluidcmp \
	fmm \
	freqmine \
	gsl-histogram \
	gsl-randist \
	jpegtran \
	lu_cb \
	lu_ncb \
	ocean_cp \
	radiosity \
	radix \
	raytrace \
	rdjpgcom \
	streamcluster \
	swaptions \
	water_nsquared \
	water_spatial \
	wrjpgcom

PARSEC_DIRNAME = \
	pkgs/kernels/dedup/inputs \
	pkgs/kernels/canneal/inputs \
	pkgs/apps/ferret/inputs \
	pkgs/apps/vips/inputs \
	pkgs/apps/raytrace/inputs \
	pkgs/apps/fluidanimate/inputs \
	pkgs/apps/facesim/inputs \
	pkgs/apps/x264/inputs \
	pkgs/apps/bodytrack/inputs \
	pkgs/apps/freqmine/inputs \
	pkgs/apps/blackscholes/inputs \
	ext/splash2x/kernels/cholesky/inputs \
	ext/splash2x/apps/water_spatial/inputs \
	ext/splash2x/apps/fmm/inputs \
	ext/splash2x/apps/raytrace/inputs \
	ext/splash2x/apps/water_nsquared/inputs \
	ext/splash2x/apps/barnes/inputs \
	ext/splash2x/apps/volrend/inputs

define PARSEC_INSTALL_TARGET_CMDS
	mkdir $(TARGET_DIR)/root/bin
	cp $(PARSEC_SITE)/parsec_exec $(TARGET_DIR)/root
	$(foreach b, $(PARSEC_BIN), \
	    cp $(PARSEC_BUILDROOT_PATH)/bin/$(b) $(TARGET_DIR)/root/bin
	)
	$(foreach d, $(PARSEC_DIRNAME), \
	    mkdir -p $(TARGET_DIR)/root/$(d)
	)
	$(foreach i, $(PARSEC_DIRNAME), \
	    tar xf $(PARSEC_SITE)/$(i)/input_simsmall.tar -C $(TARGET_DIR)/root/$(i)
	    tar xf $(PARSEC_SITE)/$(i)/input_simlarge.tar -C $(TARGET_DIR)/root/$(i)
	)
endef

$(eval $(generic-package))
