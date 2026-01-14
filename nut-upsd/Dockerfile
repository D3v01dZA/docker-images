FROM alpine:3

ENV NUT_VERSION 2.8.4
ENV NUT_SHA256 0130ba82ea79f04ba4f34c5249a85943977efd984ed7df6aec1a518d5a3594f8

ENV UPS_NAME="ups"
ENV UPS_DESC="UPS"
ENV UPS_DRIVER="usbhid-ups"
ENV UPS_PORT="auto"

ENV API_PASSWORD=""
ENV ADMIN_PASSWORD=""

ENV SHUTDOWN_CMD="echo 'System shutdown not configured!'"

RUN set -ex; \
	# run dependencies
	apk add --no-cache \
		openssh-client \
		libusb-compat \
	; \
	# build dependencies
	apk add --no-cache --virtual .build-deps \
		libusb-compat-dev \
		build-base \
	; \
	# download and extract
	cd /tmp; \
	wget http://www.networkupstools.org/source/2.8/nut-$NUT_VERSION.tar.gz; \
	echo "$NUT_SHA256  nut-$NUT_VERSION.tar.gz" | sha256sum -c -; \
	tar xfz nut-$NUT_VERSION.tar.gz; \
	cd nut-$NUT_VERSION \
	; \
	# build
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc/nut \
		--disable-dependency-tracking \
		--enable-strip \
		--disable-static \
		--with-all=no \
		--with-usb=yes \
		--datadir=/usr/share/nut \
		--with-drvpath=/usr/share/nut \
		--with-statepath=/var/run/nut \
		--with-user=nut \
		--with-group=nut \
	; \
	# install
	make install \
	; \
	# create nut user
	adduser -D -h /var/run/nut nut; \
	chgrp -R nut /etc/nut; \
	chmod -R o-rwx /etc/nut; \
	install -d -m 750 -o nut -g nut /var/run/nut \
	; \
	# cleanup
	rm -rf /tmp/nut-$NUT_VERSION.tar.gz /tmp/nut-$NUT_VERSION; \
	apk del .build-deps

COPY src/docker-entrypoint /usr/local/bin/
ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/run/nut

EXPOSE 3493
