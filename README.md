# macadam helpers

Helpers for port forwarding and file transfer against VMs managed by `macadam`.

The project also includes an `scp` helper for file transfers.

## Requirements

- `bash`
- `ssh`
- `jq`
- `macadam`

The scripts use `macadam inspect` to automatically resolve the VM SSH user, port, and private key.
For an interactive shell, use `macadam ssh <vm-name>` directly.

## Usage

```bash
./macadam-port VM_NAME -L LOCAL_PORT:HOST:REMOTE_PORT... [-f]
```

```bash
./macadam-scp VM_NAME SOURCE TARGET
```

### Parameters

- `VM_NAME`: VM name in `macadam`. Required.
- `-L SPEC`: adds a local port forward using the same format as `ssh -L`.
- `-f`: sends the tunnel process to the background.
- `-h`, `--help`: shows the help output.

## Examples

Create a foreground port tunnel:

```bash
./macadam-port my-vm -L 9990:127.0.0.1:9990
```

Create the tunnel in the background:

```bash
./macadam-port my-vm -f -L 9990:127.0.0.1:9990
```

Create multiple port forwards:

```bash
./macadam-port my-vm \
  -L 9990:127.0.0.1:9990 \
  -L 8080:127.0.0.1:8080
```

Open an interactive shell with macadam itself:

```bash
macadam ssh my-vm
```

Copy a file from the host to the VM:

```bash
./macadam-scp minha-vm ./arquivo.txt vm:/tmp/
```

Copy a file from the VM to the host:

```bash
./macadam-scp minha-vm vm:/tmp/arquivo.txt ./
```

## Behavior

- The script fails immediately if `VM_NAME` is not provided.
- `macadam-port` always uses `ssh -N`, so it only creates tunnels and never opens a shell.
- `macadam-port` requires at least one `-L` port forward.
- The SSH destination is always `127.0.0.1`, using data resolved from `macadam inspect`.
- In `macadam-scp`, use the `vm:` prefix to indicate the remote side of the transfer.