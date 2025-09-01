# Dockerfiles for kuchikinamthip on Docker Hub

This repository stores the **Dockerfiles** used to build and publish images under  
👉 [Docker Hub: kuchikinamthip](https://hub.docker.com/u/kuchikinamthip)

---

## Current Images

- **[cistrome-beta](https://hub.docker.com/r/kuchikinamthip/cistrome-beta)**  
  - Versioned Dockerfiles are stored in `cistrome-beta/<version>/Dockerfile`  
  - Example: `cistrome-beta/1.0.7-ubuntu20.04-py2/Dockerfile`

---

## Purpose

- Keep builds **transparent** and **reproducible**  
- Track changes to Dockerfiles across versions  
- Link GitHub history with Docker Hub automated builds

---

## Usage

End users should pull images directly from Docker Hub, e.g.:

```bash
docker pull kuchikinamthip/cistrome-beta:1.0.7_kk1.0
