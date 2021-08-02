# WATonomous Bastion Host

A Docker container that creates a secure auditable [bastion host](https://en.wikipedia.org/wiki/Bastion_host).

## Getting started

```bash
sudo ./start-bastion-container.sh
```

## Connection Test

There is an optional functionality that can be used to determine the health of the bastion host. Create a user named `connection_test` and run periodic checks by ssh-ing into this user:

```bash
ssh connection_test@bastion-host
# Returns:
# The SSH connection is working as of 2021-08-02T23:35:23
# Connection to bastion.watonomous.ca closed.
```

See `rootfs/etc/ssh/sshd_config` for more details.

## Credits

This repo is derived from [cloudposse/bastion](https://github.com/cloudposse/bastion). See [README.original.md](./README.original.md) for the original README.

