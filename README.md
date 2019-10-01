# php-libxml-docker-images
[![Build Status](https://travis-ci.org/andreskrey/php-libxml-docker-images.svg?branch=master)](https://travis-ci.org/andreskrey/php-libxml-docker-images)

Custom PHP images with custom libxml2 libraries 

---

These are very basic PHP images with custom libxml versions. This images allow you to test your code against most of the recent versions of libxml.

You can use them in your Dockerfile with the following statement:
 
`FROM andreskrey/php-7.0:libxml-${LIBXML_VERSION}`

Make sure you define first an environmental variable with the libxml version you want to use.
The following versions are available: `2.9.4`, `2.9.5`, `2.9.6`, `2.9.7`, `2.9.8`, and `2.9.9`.

Available [in Docker Hub](https://hub.docker.com/u/andreskrey)
