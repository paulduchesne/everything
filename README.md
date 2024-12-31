# Everything
Composition environment for Raspberry Pi. 

**Hardware**

Raspberry Pi 4B
PiSound

**Operating System**

Raspberry Pi OS (64-bit)

**Installation**

```sh
curl -s https://raw.githubusercontent.com/paulduchesne/everything/refs/heads/main/install.sh | bash
```

**VNC**

```sh
sudo apt -y install tigervnc-standalone-server
sudo nano /etc/tigervnc/vncserver-config-mandatory # add $localhost = "no";
tigervncpasswd # set pass
tigervncserver
```

Desktop can be accessed at `raspbery-pi-ip:5901`. Note that `tigervncserver` needs to be run every time after boot.

**Autostart**

The easiest way to autostart is by adding `@reboot ~/everything/run.sh` to `crontab -e`. 

**License**

Creative Commons Zero
