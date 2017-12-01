#!/bin/bash -xe

{
  echo "First, we pull a base image we want to run; in this case, we'll use the stock Ubuntu image.";
  echo "Note: this pulls the image from the official docker registry. We could also replace ubuntu with ubuntu:16.04 or ubuntu:latest (the :tag part specifies the tag, so we could also use ubuntu:14.04 to pull the 14.04 version of Ubuntu).";
} 2>/dev/null
docker pull ubuntu

{
  echo "Now, we'll make a directory to mount within the container and put a sample file there.";
} 2> /dev/null
mkdir -p ./data/
date > ./data/currentdate

{
  echo "And now... we create the container! We'll run bash interactively within it.";
  echo "Note the order in the command below. All the -flags must come before the image (\"ubuntu\" in this case). The command part (\"bash\" in this case) part is optional and if not specified, will run the default command specified when the image is created (see the Dockerfiles tutorial to learn about that!).";
  echo "Do whatever you'd like in this container; only changes in /data will be preserved when the container finished. Type \"exit\" or press Ctrl+D to exit when you're done."
} 2> /dev/null
docker run -it -v $(realpath ./data):/data ubuntu bash

{
  echo "Done! That wasn't so hard.";
} 2> /dev/null
