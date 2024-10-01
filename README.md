# 🔑 keycloak-heroku

---

> 一键部署 Keycloak 到 Heroku PaaS 平台、Okteto 等 k8s 平台。
>
> Deploy Keycloak to Heroku PaaS and k8s such as Okteto by just one click.

[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=bugs)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=Jeff-Tian_keycloak-heroku&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=Jeff-Tian_keycloak-heroku)

## 🇨🇳 中文版说明

[![部署到 Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/ahmedelraei/keycloak-heroku-deploy)

Keycloak 是一款优秀的开源身份与访问管理系统，~~直接部署到 Heroku 会存在一个小问题，因此需要做一些小调整。本仓库基于上游的调整，升级了
Keycloak 的版本，并适配了 Heroku 的免费
Dyno，从而不需要付费，免费拥有一个 Keycloak 实例~~，本仓库增加了 Jeff Tian 参与开发的各个 Keycloak 社交登录插件，比如微信登录、钉钉登录、企业微信等等，并提供了 Docker 部署方式和一键部署到 Heroku 的方式。

![](./微信截图_20240823091341.png)

### 线上域名

- Heroku:
    - https://keycloak.jiwai.win （使用 Cloudflare DNS）
    - https://unisso.herokuapp.com/ （Heroku 默认）
- ~~Okteto~~ （Okteto 从 2024 年 1 月 15 日起不再免费，资源已经被释放）:
    - ~~https://keycloak-jeff-tian.cloud.okteto.net/~~

### 注意 ⚠️

详见《[Free Arch: Bye-bye to Heroku - Jeff Tian的文章 - 知乎](https://zhuanlan.zhihu.com/p/567187898)》，Heroku 不再提供免费
Dyno，因此，部署该项目到 Heroku，可能会产生费用。替代方案：部署到 Okteto 或者 Naptive 等免费的 k8s 集群☸️ 中。

### 📃 更多说明：

- [FreeArch: 一键拥有你自己的身份认证平台 Keycloak！
  ](https://zhuanlan.zhihu.com/p/554534245)
- [【免费架构】Heroku 不免费了，何去何从之 Keycloak 的容器化部署之路 - Jeff Tian的文章 - 知乎](https://zhuanlan.zhihu.com/p/611823061)

### ✨ Star 历史

![https://api.star-history.com/svg?repos=jeff-tian/keycloak-heroku&type=Date](https://api.star-history.com/svg?repos=jeff-tian/keycloak-heroku&type=Date "Star History")

### 💻 开发

运行部署到 k8s 集群的版本

```shell
mvn clean install
docker compose up --build
```

运行部署到 heroku 的版本：

```shell
mvn clean install
docker compose -f docker-compose.heroku.yml up --build
```

在本地用 h2 数据库模拟部署到 heroku 的版本：

```shell
# The following token was restricted to be only able to pull
# Jeff Tian's GitHub Packages, so it's OK to be public and included
# in the source code
GH_TOKEN=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 docker compose -f docker-compose.local.yml up --build
open http://localhost:8080/
```

在本地用 PostgreSQL 数据库模拟部署到 heroku 的版本：

```shell
docker compose -f docker-compose.local-postgres.yml up --build
open http://localhost:8080/
```

### 💵 欢迎问我！

有任何相关问题，欢迎来知乎咨询：

<a href="https://www.zhihu.com/consult/people/1073548674713423872" target="blank"><img src="https://first-go-vercel.vercel.app/api/dynamicimage" alt="向我咨询"/></a>

### 感谢

- https://github.com/mieckert/keycloak-heroku 提供的第一版

## 🇱🇷 English README

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

This repository deploys the [Keycloak](https://www.keycloak.org) Identity and Access Management Solution
to Heroku. It is based of Keycloak's official docker image with some slight modifications to use the
Heroku variable for `PORT` and `DATABASE_URL` properly.

The deployment will be made with a single Free dyno (although it won't run very well in smaller dynos
due to Java's memory hunger, it can be used as testing purpose without issues) with a free Postgres database attached.
