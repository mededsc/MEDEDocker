See below for the basic python Docker file.
It uses a startup.sh script which is attached (and you don't really need I think).
When starting a container for the image the startup.sh file is executed.
This one starts up the jupyter service.
In batch mode this script is not called.
Cheers
Gerard

