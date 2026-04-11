# LiamOS

Based on the [projectbluefin/finpilot](https://github.com/projectbluefin/finpilot) template, my custom immutable OS.

# Switch to LiamOS

Switch to your image:
```bash
sudo bootc switch ghcr.io/your-username/liamos:stable
sudo systemctl reboot
```

## Local Testing

Test your changes before pushing:

```bash
just build              # Build container image
just build-qcow2        # Build VM disk image
just run-vm-qcow2       # Test in browser-based VM
```
