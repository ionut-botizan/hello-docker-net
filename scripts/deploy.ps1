
$InstanceName = "hello-docker"
$InstancePort = 80

# Create EC2 instance
docker-machine create -d amazonec2 --amazonec2-region "eu-west-1" --amazonec2-open-port $InstancePort --amazonec2-instance-type "t2.micro" $InstanceName
# Set the active machine using environment variables
docker-machine env $InstanceName | Invoke-Expression
# Deploy
docker-compose up --build -d lb
# Environment cleanup
docker-machine env -u | Invoke-Expression

Write-Host 
Write-Host -NoNewLine "App available at "
Write-Host -ForegroundColor Blue "http://$(docker-machine ip $InstanceName):$InstancePort"
