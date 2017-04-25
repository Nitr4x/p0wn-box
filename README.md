# p0wnM3

# Purpose

This Dockerfile builds a Debian-based Docker container with a bunch of pentesting tools installed.

**A quick and easy way to deploy a pentesting plateform on any box, including Linux, MacOS or Windows!**

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

It also includes:

- wordlists from Kali Linux
- A binary folder, allowing to easily run each binary independently

# Build

To build the container, just use this command:

```bash
docker build -t pentest .
```

Docker will download the Debian image and then execute the installation steps.

> Be patient, the process can be quite long the first time.

Note that you may want to:

- If you wish to change the container name, please, run the script init.sh in order to update the bin folder.
- To easily access each command, add the bin folder to your environement PATH.

# Run

Once the build process is over, get and enjoy a neat msf prompt with this command:

```bash
sudo docker run -it -v ~/p0wnM3/:/tmp/data --name pentest pentest
3#ocker run --rm -i -t -p 9990-9999:9990-9999 -v /home/<USER>/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data --name msf phocean/msf
```

Explanations:

- We map the port range from 9990 to 9999 to our host, to catch reverse shells back.
- We mount the local *.msf4* folder, where you can set your prompt and put custom scripts and modules, to */root/.msf4* inside the container (if you want to make some changes at runtime, beware to do it from your host, not from within the container).
- Similarly, we mount a */tmp/data folder* to exchange data (a dump from a successful exploit, for instance).

Of course, it is up to you to adjust it to your taste or need.

You can also give it full access to the host network:

> Note that this can be **risky** as all services on your host, including those that listen on localhost, would be reachable from within the container, in case it is compromise.

```bash
docker run --rm -it --net=host -v /home/<USER>/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data --name msf phocean/msf
```

At any time, you can exit, which only stops (suspend) the container.
