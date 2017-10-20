# p0wn-box

# Purpose

This Dockerfile builds a Debian-based Docker container with a bunch of pentesting tools installed.

**A quick and easy way to deploy a pentesting platform on any box, including Linux, MacOS or Windows!**

Tools installed:

- dirb
- john
- p0f
- patator
- dotdotpwn
- enum4linux
- dnsenum
- smtp-user-enum
- hydra
- wpscan
- snmpcheck
- wafw00f
- medusa
- hping3
- crunch
- setoolkit
- metasploit
- httrack

It also includes:

- Wordlists from Kali Linux
- A binary folder, allowing to easily run each binary independently

# Build

To build the container, just use this command:

```bash
docker build -t pentest .
```

Docker will download the Debian image and then execute the installation steps.

> Be patient, the process can be quite long the first time.

Note that you may want to:

- If you wish to change the container name, please, run the script rename.sh in order to update the bin folder.
- To easily access each command, add the bin folder to your environment PATH.

# Run

Once the build process is over, get and enjoy your tools as you were on a virtual machine !

```bash
sudo docker run -t -p 9990-9999:9990-9999 -v ~/p0wnM3/:/tmp/data --name pentest pentest
```

Explanations:

- We map the port range from 9990 to 9999 to our host (useful for reverse tcp connexion)
- We mount a shared folder to simplify the data exchange between the container and the host

Of course, it is up to you to adjust it to your taste or need.
