#!/bin/bash -xe


{
  echo -e "\e[36m"
  echo "First, take a look at the Dockerfile in this directory.";
  echo "We want to build it; the process of building uses a Dockerfile to generate an image which we can then use to launch containers based on this image.";
  echo "The \"-t dockerexample-01-nginx\" says to tag the image as being named dockerexample-01-nginx which we can then use to refer to it later. If we omit this bit, it will still generate an image but we must use the unique ID that docker gives to the image to refer to it when we want to run it.";
  echo "Lastly the \".\" at the very end specifes the context we want to use to build the image. Docker (by default) looks for a file named Dockerfile in this directory and send the entire directory to the docker daemon to build it. This means that only files inside the build context can be ADD-ed (i.e. ADD /etc/krb5.conf will NOT work since /etc is outside of the build context directory).";
  echo -e "\e[39m";
} 2>/dev/null
docker build -t dockerexample-01-nginx .

{
  echo -e "\e[36m"
  echo "Now let's run a container using the image we just built.";
  echo "The \"-p 80:80\" bit says that we want to map port 80 on the host machine to port 80 on the docker container (\"-p 8000:80\" would map port 8000 on the host machine to port 80 on the docker container). Any ports not explictly specified are not opened.";
  echo "We'll also mount ./html as a data volume. Because a data volume acts (and is fact, implemented as) a bind mount, changes we make will show up in real time. This is why we use a volume instead of ADD'ing the html directory in the Dockerfile.";
  echo -e "\e[1m"
  echo "==IMPORTANT== Press Ctrl+C to close the nginx container when you're done. ==IMPORTANT=="
  echo -e "\e[36m\e[21m"
  echo "Open a web browser and navigate to the server where you're running this tutorial from and check it out! Also try editing the html directory to see that your changes are made in real time (barring any web browser caching madness).";
  echo -e "\e[39m"
} 2> /dev/null
docker run -p 80:80 -v $(realpath ./html):/html dockerexample-01-nginx

{
  echo -e "\e[36m"
  echo "Done! That wasn't so hard.";
  echo -e "\e[39m"
} 2> /dev/null
