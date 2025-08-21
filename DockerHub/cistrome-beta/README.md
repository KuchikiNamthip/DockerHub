# Cistrome BETA 1.0.7 (Docker)

This repository provides a prebuilt Docker image for [Cistrome BETA](http://cistrome.org/BETA/),  
a tool for integrative analysis of ChIP-seq and RNA-seq data.

The image is based on **Ubuntu 20.04** with:
- Python 2.7 + pip
- R (base)
- Cistrome BETA v1.0.7 installed from source
- Non-root user mapping (`betauser`) for safer execution

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
beta -h
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

## 🔹 Tags

* `1.0.7` → Fixed version (recommended)
* `latest` → Convenience tag, may update

For reproducibility, you can also pull by **digest**:

```bash
docker pull kuchikinamthip/cistrome-beta@sha256:159a5e052086bf7ab6d075bdd5f5ba72af32536d1354aacac9ae9b45e01f4e81
```

---

## 🔹 Notes

* Base: `ubuntu:20.04` (Python 2.x supported here)
* Non-root user by default (`betauser`)
* Maintainer: (Namthip) Krittiyabhorn Kongtanawanich [kkrittiyabhorn@gmail.com](mailto:kkrittiyabhorn@gmail.com)

---

## 🔹 Citation

If you use Cistrome BETA in your research, please cite:

Wang, S., Sun, H., Ma, J. et al. Target analysis by integration of transcriptome and ChIP-seq data with BETA. *Nat Protoc* 8, 2502–2515 (2013).
DOI: [10.1038/nprot.2013.150](https://doi.org/10.1038/nprot.2013.150)