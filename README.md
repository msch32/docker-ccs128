# Code Composer Studio 12.8.1 on arch linux

Code Composer Studio ist für Linux verfügbar. Diese ältere Version benötigt jedoch dementsprechend veraltete packages und 32-Bit Versionen von verschiedenen Bibliotheken.
Selbst wenn diese Voraussetzungen erfüllt sind, schlägt die Installation fehl. Um diese Probleme zu umgehen, wurde ein Docker-Container, basierend auf einer älteren Ubuntu-LTS verwendet.

## Installation
Clone das Repository an einen sinnvollen Ort auf deinem System, beispielsweise `~/docker`.
```sh
git clone https://github.com/msch32/docker-ccs128.git
```

In diesen Ordner muss auch die .zip Datei von der Texas Instruments Webseite ([direkte Downloadseite](https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.8.1/CCS12.8.1.00005_linux-x64.tar.gz)) entpackt werden. So kann später von dem Container aus auf das Installationsskript zugegriffen werden.  

Das dockerfile muss vor den weiteren Schritten noch gebaut werden. 
```sh
docker build -t ccs-ubuntu2204
```

Der Container wird mit dem Befehl `./run-ccs.sh` gestartet. In der Command-Line des Containers muss in den Installations-Ordner navigiert werden. Dieser ist standardmäßig auf den gleichen Ordner gemappt, in dem das Dockerfile und das Run-Skript liegen.
```sh
cd /installer_folder/
```

Von dort kann jetzt mit `./ccs_setup_12.8.1.00005.run` die Installation von Code Composer Studio gestartet werden.
**ACHTUNG** Der Default-Installationspfad `/root/ti/…` liegt in dem Speicher des Containers. Dieser wird nach Beenden des Containers gelöscht.  
Durch Austauschen von `/root/…` durch `/home/…` in dem vorgeschlagenen Installationspfad wird dieser an einen Ort gelegt, der durch das Run-Skript auf den Ordner `~/ccs_containerdata` (Der Ordner wird durch das Run-Skript erstellt) gemapt wird.
Somit geht die Installation und die Daten nach Beenden des Containers nicht verloren.

## Verwendung
Die ausführbare Datei kann über folgenden Befehl in der Docker Kommando-Zeile aufgerufen werden:
```sh
/home/ti/ccs1281/ccs/eclipse/ccsstudio
```

## Modifikation
Sollten zusätzliche Pakete in dem Container zur Verfügung stehen, können diese im Dockerfile hinzugefügt werden.
In der aktuellen Version werden zusätzlich tmux und einige Pakete zum Debuggen mit GDB installiert.

Falls die Pfade anders gewählt werden sollen, kann dies in `run-ccs.sh` angepasst werden.
