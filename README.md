TODO

pymatgen - added instructions in 'working' dockerfile, tested on compute terminal, need to test complete dockerfile with idies image

mantid - same as above

david notebooks - added git clone statement 

matlab - switching kernels in same container - ask gerard for matlab dockerfile - Gerard said
that we cannot switch between the two in the same container. matlab container much more complex

gsas ii cmd line as a start - x windows later

uintah eventually


scientific linux repo:
docker pull dmedv/compute-base-sl:7.2
docker tag dmedv/compute-base-sl:7.2 base:7.2

then build idies image with idies-dockerfile:
docker build -t idies idies/

then build python on top of idies:
docker build -t python python/

then build MEDE on top of python:
docker build -t mede mede/

