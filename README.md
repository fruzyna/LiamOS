# LiamOS

Based on the [projectbluefin/finpilot](https://github.com/projectbluefin/finpilot) template, my custom immutable OS.

## Switch to LiamOS

```bash
sudo bootc switch ghcr.io/fruzyna/liamos:latest # or liamos-nvidia
sudo systemctl reboot
```

## Local Development

```bash
sudo just build liamos local
sudo bootc switch --transport containers-storage localhost/liamos:local
sudo systemctl reboot
```
