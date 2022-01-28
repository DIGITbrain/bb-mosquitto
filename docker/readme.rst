=========
Mosquitto
=========

About
=====
**Mosquitto** [1]_ is an open source implementation of a server for version 5.0, 3.1.1, and 3.1 of the **MQTT** protocol. 
It also includes a C and C++ client library, and the mosquitto_pub and mosquitto_sub utilities for publishing and subscribing.

Version
-------
Mosquitto version **2.0.14** deployed based on official Docker Hub image: [2]_.

License
-------
**EPL** [3]_ / **EDL** [4]_ 

Pre-requisites
==============
* *docker* installed
* access to DIGITbrain private docker repo (username, password) to pull the image:
  
  - ``docker login dbs-container-repo.emgora.eu``
  - ``docker pull dbs-container-repo.emgora.eu/mqtt:2.0.14``

Usage
=====
.. code-block:: bash

  docker run -d --rm --name mqtt \
    -e USERNAME=myusername \
    -e PASSWORD=mypassword \
    -p 1883:1883 \
    mqtt:2.0.14

where USERNAME and PASSWORD parameters create a new database user with the given username and password,
and standard MQTT (TLS) port 1883 is opened on the host.

.. warning::
  Always update the ``USERNAME`` and ``PASSWORD`` parameters prior to running this container.

Security
========

The container uses **TLS traffic encryption** and **username-password authentication**. 
You should use the server certificate of your own (see Configuration below).

TLS client authentication is also configurable.

Configuration
=============

Parameters
----------
.. list-table:: 
   :header-rows: 1

   * - Name
     - Example
     - Comment
   * - *Username*
     - ``-e USERNAME=myusername``
     - Username for a newly created user
   * - *Password*
     - ``-e PASSWORD=mypassword``
     - Password for a newly created user

Ports
-----
.. list-table:: 
  :header-rows: 1

  * - Container port
    - Host port bind example
    - Comment
  * - *SSL*
    - ``-p 1883:1883``
    - Mosquitto SSL port 

Volumes
-------
.. list-table:: 
  :header-rows: 1

  * - Name
    - Volume mount example
    - Comment
  * - *Data*    
    - ``-v $PWD/data:/mosquitto/data``
    - Mosquitto data will be persisted in host directory: ``./data``
  * - *Configuration*    
    - ``-v $PWD/mosquitto.conf:/mosquitto/config/mosquitto.conf``
    - Custom configuration file for Mosquitto, see [5]_
  * - *Passwords*    
    - ``-v $PWD/data:/mosquitto/passwords``
    - Mosquitto passwords file containing non-hashed passwords: ``username:password`` lines (automatically encoded on startup) 
  * - *Logs*    
    - ``-v $PWD/log:/mosquitto/log``
    - Mosquitto logs will be persisted in host directory: ``./log``
  * - *CA certificate*    
    - ``-v $PWD/certificates/ca.crt:/mosquitto/certs/ca.pem``  
    - Certificate Authority certificate
  * - *Server certificate*    
    - ``-v $PWD/certificates/server-cert.pem:/mosquitto/certs/server-cert.pem``  
    - Server certificate
  * - *Server key*    
    - ``-v $PWD/certificates/server-key.pem:/mosquitto/certs/server-key.pem``  
    - Server key file

References
==========
.. [1] https://mosquitto.org/

.. [2] https://hub.docker.com/_/eclipse-mosquitto

.. [3] https://www.eclipse.org/legal/epl-v10.html

.. [4] https://eclipse.org/org/documents/edl-v10.php

.. [5] https://mosquitto.org/man/mosquitto-conf-5.html


