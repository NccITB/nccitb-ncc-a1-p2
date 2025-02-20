FROM ubuntu:24.04

# Actualitza els paquets i instal·la els requeriments
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    wget \
    curl \
    python3 \
    python3-pip \
    openssh-server \
    gpg \
    dbus-x11 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash NCC && \
    echo "NCC:@ITB2024" | chpasswd
WORKDIR /home/NCC

RUN wget -qO- https://update.code.visualstudio.com/latest/linux-deb-x64/stable | \
    tee /tmp/vscode.deb > /dev/null && \
    apt install -y /tmp/vscode.deb && \
    rm /tmp/vscode.deb

# Configura el servidor SSH
RUN mkdir /var/run/sshd && echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Configura el servidor VNC
RUN mkdir -p ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 0600 ~/.vnc/passwd

# Copia el fitxer xstartup des del host al contenidor
COPY ./xstartup /home/NCC/.vnc/xstartup

# Asegura que el fitxer xstartup té permisos d'execució
RUN chmod +x /home/NCC/.vnc/xstartup

USER NCC

# Exposa els ports necessaris
EXPOSE 22 5901

# Comanda per iniciar el servidor SSH i VNC
CMD ["/usr/sbin/sshd && vncserver :1 -geometry 1280x1024 -depth 24 && tail -f /dev/null"]

