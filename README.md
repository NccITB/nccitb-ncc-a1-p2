# Docker

Heu de crear una imatge de docker usant un dockerfile basat en Ubuntu 24.04 que contingui un entorn gràfic amb XFCE i un servidor VNC, i visual studio code i python, i ssh. 

## Construir la Imatge Docker

Per construir la imatge Docker, assegura't de tenir Docker instal·lat al teu sistema. Després, executa la següent comanda al directori on es troba el teu Dockerfile:

    docker build -t nccitb/ncc-a1-p2:latest .

Aquesta comanda crearà una imatge amb el nom i etiqueta especificats.

https://hub.docker.com/r/nccitb/ncc-a1-p2

## Executar un nou contenidor amb docker run

Un cop la imatge estigui construïda, pots executar un nou contenidor amb la següent comanda:

    docker run -d -p 5900:5900 --name nom-contenidor nccitb/ncc-a1-p2:latest

Explicació dels paràmetres:

-d: Executa el contenidor en segon pla.

-p 5900:5900: Exposa el port 5900 del contenidor a l'amfitrió per a connexions VNC.

--name nom-contenidor: Assigna un nom al contenidor.

## Acces VNC
En un client VNC intrudueixes 
        localhost:5901
Intrudueixes contrsenya i ja pots accedir.
