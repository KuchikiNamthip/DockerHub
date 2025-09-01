# [Cistrome BETA 1.0.7 (Docker)](https://hub.docker.com/repository/docker/kuchikinamthip/cistrome-beta/general) 

This repository provides a prebuilt Docker image for [Cistrome BETA](http://cistrome.org/BETA/),  
a tool for integrative analysis of ChIP-seq and RNA-seq data.

The image is based on **Ubuntu 20.04** with:
- Python 2.7 + pip
- R (base)
- Cistrome BETA v1.0.7 installed from source
- Non-root user mapping (`betauser`) for safer execution

Dockerfile can be found on [my GitHub repository](https://github.com/KuchikiNamthip/DockerHub/tree/main/cistrome-beta)

---

## 🔹 Quick Start

Pull the image:
```bash
docker pull kuchikinamthip/cistrome-beta:1.0.7_kk1.0
````

Run interactively:

```bash
docker run --rm -it kuchikinamthip/cistrome-beta:1.0.7_kk1.0
```

Check BETA:

```bash
BETA -h
```

---

## 🔹 Using With Your Data

Mount your working directory:

```bash
docker run --rm -it \
  -v $PWD:/work -w /work \
  kuchikinamthip/cistrome-beta:1.0.7_kk1.0 \
  bash -lc 'beta plus -h'
```

---

## 🔹 Important Notes

### 1. Run as Root (Recommended)

To avoid **permission issues**, run with `sudo` and `--user root`:

```bash
sudo docker run --rm -it --user root \
  -v $PWD:/work -w /work \
  kuchikinamthip/cistrome-beta:1.0.7_kk1.0
```

Confirm you are root inside the container:

```bash
whoami   # should print 'root'
```

---

### 2. Fix Python Egg Cache

Some Python packages need a writable cache. Run these commands **every time** you start the container:

```bash
cd /home   # move to /home

mkdir -p /tmp/.python-eggs
export PYTHON_EGG_CACHE=/tmp/.python-eggs
```

---

### 3. One-Liner Helper Script (Recommended)

Instead of typing every time, you can use this **ready-to-use startup command**:

```bash
sudo docker run --rm -it --user root \
  -v $PWD:/work -w /work \
  kuchikinamthip/cistrome-beta:1.0.7_kk1.0 \
  bash -lc 'mkdir -p /tmp/.python-eggs && export PYTHON_EGG_CACHE=/tmp/.python-eggs && bash'
```

✔ This will:

* Start the container as **root**
* Create `/tmp/.python-eggs`
* Set `PYTHON_EGG_CACHE` automatically
* Drop you into an interactive shell

---

## 🔹 Troubleshooting

**❌ Problem: Permission denied when writing files**
✔ Solution: Run the container as root (`--user root`).

---

**❌ Problem: ImportError or Python egg cache errors**
✔ Solution: Use the one-liner above, or manually run:

```bash
mkdir -p /tmp/.python-eggs
export PYTHON_EGG_CACHE=/tmp/.python-eggs
```

---

**❌ Problem: Changes lost after container exit**
✔ Solution: Always mount your working directory with `-v $PWD:/work -w /work`.
Files saved in `/work` will persist on your host machine.

---

## 🔹 Tags

* `1.0.7` → Fixed version (recommended)
* `latest` → Convenience tag, may update

For reproducibility, you can also pull by **digest**:

```bash
docker pull kuchikinamthip/cistrome-beta@sha256:159a5e052086bf7ab6d075bdd5f5ba72af32536d1354aacac9ae9b45e01f4e81
```

---

## 🔹 Environment Details

* Base: `ubuntu:20.04` (Python 2.x supported here)
* Default user: `betauser` → safer but may cause permission issues (use root if needed)
* Maintainer: (Namthip) Krittiyabhorn Kongtanawanich [kkrittiyabhorn@gmail.com](mailto:kkrittiyabhorn@gmail.com)

---

## 🔹 Citation

If you use Cistrome BETA in your research, please cite:

Wang, S., Sun, H., Ma, J. et al. Target analysis by integration of transcriptome and ChIP-seq data with BETA. *Nat Protoc* 8, 2502–2515 (2013).
DOI: [10.1038/nprot.2013.150](https://doi.org/10.1038/nprot.2013.150)

```

---

✨ Now users have **three levels of options**:  
- Minimal (`docker run …`)  
- With manual egg-cache fix  
- One-liner that automates everything  