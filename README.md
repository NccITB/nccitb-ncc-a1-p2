Nom del Projecte

Aquest projecte consisteix en la creació i publicació d'una imatge Docker amb suport per a connexions VNC.

Construir la Imatge Docker

Per construir la imatge Docker, assegura't de tenir Docker instal·lat al teu sistema. Després, executa la següent comanda al directori on es troba el teu Dockerfile:

docker build -t nom-usuari/nom-imatge:latest .

Aquesta comanda crearà una imatge amb el nom i etiqueta especificats.

Executar un Nou Contenidor

Un cop la imatge estigui construïda, pots executar un nou contenidor amb la següent comanda:

docker run -d -p 5900:5900 --name nom-contenidor nom-usuari/nom-imatge:latest

Explicació dels paràmetres:

-d: Executa el contenidor en segon pla.

-p 5900:5900: Exposa el port 5900 del contenidor a l'amfitrió per a connexions VNC.

--name nom-contenidor: Assigna un nom al contenidor.

Connectar-se amb un Client VNC

Per accedir a l'entorn gràfic del teu contenidor, necessitaràs un client VNC com TigerVNC o RealVNC. Segueix aquests passos:

Instal·la un client VNC: Descarrega i instal·la el client de la teva preferència.

Obre el client VNC.

Crea una nova connexió:

Direcció: localhost:5900

Nom de la connexió: (opcional, descriptiu)

Inicia la connexió i, si es demana, introdueix la contrasenya del servidor VNC.

Un cop autenticat, hauràs de veure l'entorn d'escriptori proporcionat pel contenidor Docker.

URL Pública de Docker Hub

Pots trobar aquesta imatge Docker al Docker Hub a la següent URL:

https://hub.docker.com/r/nom-usuari/nom-imatge

(Sustitueix nom-usuari i nom-imatge pels valors reals del teu projecte).

