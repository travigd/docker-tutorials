# Dockerfiles are used to generate reproducible images from a sequence of
# instructions. If the image has already been built, it will use that image.
# If the Dockerfile has changed in the middle then the build process will start
# from that point (see the note below about image layers).

# this specifies the base image (normally something like ubuntu or centos, but
# we can also say, for example, nginx, to build an image on top of already
# containerized application
FROM nginx

# the COPY command copies files from the current directory (see note about
# which paths you can specify below)
# you could also use "ADD", but it's discouraged because it has "magic"
# behavior (for example, you can use an http:// link with ADD)
# note: this works because the nginx default config reads everything in conf.d
COPY mysite.conf /etc/nginx/conf.d/

# the RUN command runs a command in the container
# we want to delete the default config since we just wrote one
RUN rm -f /etc/nginx/conf.d/default.conf

# NOTE: you can only specify paths that are in the build context (normally
# the directory in which the Dockerfile lives)

# NOTE (image layers): every command (FROM/COPY/RUN/etc.) creates a new layer
# which serves as a kind of "caching" point (so if you have 10 instructions and
# decide to change #6, the image build process up to instruction 5 has already
# been done so it starts from that instead of re-doing the first 5 steps too).
# IMPORTANT: this also means that every instruction contributes to the disk
# space required to store the image; generally, fewer layers is considered the
# better design strategy (but this should also be balanced with how
# in-development the Dockerfile is so that you don't waste time rebuilding
# lots of images for small changes).
# IMPORTANT: this also means that you should consider the order in which you
# specify the commands carefully (things that change less should go first,
# things that are likely to change more often should go near the end).
