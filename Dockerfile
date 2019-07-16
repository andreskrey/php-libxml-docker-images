ARG php_version
FROM php:${php_version}-cli

# Install custom version of libxml2
RUN apt-get update && apt-get install -y automake libtool unzip libssl-dev
# Remove current version
RUN apt-get remove -y libxml2
# Download new version, configure and compile
ARG libxml_version
RUN curl https://gitlab.gnome.org/GNOME/libxml2/-/archive/v$libxml_version/libxml2-v$libxml_version.zip -o /tmp/libxml.zip && \
	cd /tmp && \
	unzip libxml.zip && \
	cd libxml2-v$libxml_version && \
	./autogen.sh --libdir=/usr/lib/x86_64-linux-gnu && \
	make && \
	make install
# Recompile PHP with the new libxml2 library
RUN docker-php-source extract && \
	cd /usr/src/php && \
	./configure \
		--with-libxml-dir=/usr/lib/x86_64-linux-gnu \
		--enable-mbstring \
		--with-openssl \
		--with-config-file-path=/usr/local/etc/php \
		--with-config-file-scan-dir=/usr/local/etc/php/conf.d && \
	make && make install && \
	docker-php-source delete

RUN pecl install xdebug && docker-php-ext-enable xdebug
