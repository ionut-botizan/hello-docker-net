
InstanceName="hello-docker"
InstancePort=80

# Create EC2 instance
docker-machine create -d amazonec2 --amazonec2-region "eu-west-1" --amazonec2-open-port $InstancePort --amazonec2-instance-type "t2.micro" $InstanceName
# Set the active machine using environment variables
eval $(docker-machine env $InstanceName)
# Deploy
docker-compose up --build -d lb
# Environment cleanup
eval $(docker-machine env -u)

echo ""
echo -e "App available at \e[1;34mhttp://$(docker-machine ip $InstanceName):$InstancePort\e[0m"
