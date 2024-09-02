clear
echo .
echo Stop Homeassistant
docker stop HomeAssistant8123
echo .
sleep 2
echo Delete Homeassistant Database
rm /share/Container/HA-Config/home-assistant*
echo .
sleep 2
echo Delete Homeassistant Container
docker rm HomeAssistant8123
echo .
sleep 2
echo Delete Homeassistant Image
docker image rm homeassistant/home-assistant
echo .
sleep 2
echo Homeassistant Image Herunterladen
echo .
docker pull homeassistant/home-assistant
sleep 2
echo Create Homeassistant Container 
docker run -d \
--name="HomeAssistant8123" \
--restart unless-stopped \
--privileged \
-v /share/Container/HA-Config:/config \
-e "TZ=Europe/Berlin" \
--net=host \
homeassistant/home-assistant
