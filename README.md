# General

## Deployment type

Docker, Kubernetes (Helm and native) and Micado [2].

## Image

Based on official image on Docker Hub: https://hub.docker.com/_/eclipse-mosquitto

## Licence

Eclipse Public License 2.0

## Version

2.0.17

## Description

> Mosquitto is an open source implementation of a server for version 5.0, 3.1.1, and 3.1 of the MQTT protocol. It also includes a C and C++ client library, and the `mosquitto_pub` and `mosquitto_sub` utilities for publishing and subscribing. [1]

This repository contains:

    - A Helm chart for Kubernetes based deployment.
    - Kubernetes manifests generated from the Helm chart.
    - Micado [2] deployment files generated using the Kubernetes manifests.

Sample configuration file for Mosquitto can be found in the `mosquitto/config/mosquitto.conf` file.

# References

[1] https://github.com/eclipse/mosquitto

[2] https://github.com/micado-scale