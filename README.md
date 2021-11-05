# marrold-dnscrypt

## Introduction

The contents of this repo allow you to build a container that runs a [dnscrypt](https://github.com/DNSCrypt/dnscrypt-proxy) DNS proxy that forwards requests via DoH or the dnscrypt protocol.

## Usage

## Docker Compose

It's assumed you will use Docker Compose to run the container.

### Environment Variables

| Variable | Purpose |
| ---  |--- |
|PUID| The User ID to run Bind |
|GUID| The Group ID to run Bind |
|TZ| The local timezone |
|DNSCRYPT_SERVER_NAMES| A list of [public servers](https://dnscrypt.info/public-servers) to forward requests to. |

### docker-compose.yml

An example `docker-compose.yml` file can be found below.

```
---
version: "2.1"
services:
  dnscrypt:
    image: marrold-dnscrypt
    container_name: marrold-dnscrypt
    environment:
      - PUID=5000
      - PGID=5000
      - TZ=Europe/London
      - DNSCRYPT_SERVER_NAMES=['cloudflare']
    ports:
      - 53:53
      - 53:53/udp
    restart: unless-stopped
```

## License

The Dockerfile, build scripts and configuration is licensed under the terms of the _MIT license_. For other dependencies such as dnscrypt, please see their relevant licenses.

Copyright (c) 2021 Matthew Harrold

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

