# `spark-k8s-addons-ds`

![CI Status](https://img.shields.io/github/workflow/status/dsaidgovsg/spark-k8s-addons-ds/CI/main?label=CI&logo=github&style=for-the-badge)

CI Dockerfile setup to install standard Data Science packages on top of the
enhanced `spark-k8s-addons` Docker image, which is built using
[this repository](https://github.com/dsaidgovsg/spark-k8s-addons).

## How to build

```bash
SPARK_VERSION=3.3.0
HADOOP_VERSION=3.3.2
SCALA_VERSION=2.12
JAVA_VERSION=8
PYTHON_VERSION=3.8

IMAGE_NAME=spark-k8s-addons-ds
docker build -t "${IMAGE_NAME}" \
    --build-arg SPARK_VERSION="${SPARK_VERSION}" \
    --build-arg HADOOP_VERSION="${HADOOP_VERSION}" \
    --build-arg SCALA_VERSION="${SCALA_VERSION}" \
    --build-arg JAVA_VERSION="${JAVA_VERSION}" \
    --build-arg PYTHON_VERSION="${PYTHON_VERSION}" \
    .
```

## Pip packages added

- attrs==20.3.*
- croniter==0.3.*
- matplotlib==3.2.*
- numpy==1.17.*
- pandas==0.25.*
- pendulum==2.1.2
- pyjwt==1.7.*
- pyproj==1.9.*
- python-dateutil==2.8.*
- requests==2.22.*
- shapely==1.6.*

## How to Apply Template for CI build

For Linux user, you can download Tera CLI v0.4 at
<https://github.com/guangie88/tera-cli/releases> and place it in `PATH`.

Otherwise, you will need `cargo`, which can be installed via
[rustup](https://rustup.rs/).

Once `cargo` is installed, simply run `cargo install tera-cli --version=^0.4.0`.
