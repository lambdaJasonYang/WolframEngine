FROM ubuntu

RUN apt update && apt install -y wget avahi-daemon sudo libgl1 libasound2 libegl1 libfontconfig1 libfreetype6 libx11-6 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xfixes0 libxcb1 libxext6 libxkbcommon-x11-0 libxkbcommon0 xz-utils

RUN wget -O LINUX "https://account.wolfram.com/dl/WolframEngine?version=14.0&platform=Linux&downloadManager=false&includesDocumentation=false" 
RUN sudo chmod 777 LINUX
RUN sudo ./LINUX -- -auto
RUN rm LINUX

CMD ["wolframscript"]