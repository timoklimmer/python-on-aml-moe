# set endpoint name
$resource_group = "AzureMLSpikesAndDemos"
$location = "westeurope"
$workspace = "AzureMLSpikesAndDemos"
$endpoint_name = "python-on-aml-moe-k9672trb"  # please change to avoid naming collisions!

# set default resource group, workspace and location
az configure --scope local --defaults workspace=$workspace group=$resource_group location=$location

# deploy endpoint
az ml online-endpoint create -f endpoint.yml --set name=$endpoint_name

# deploy deployment
az ml online-deployment create -f deployment.yml --all-traffic --set endpoint_name=$endpoint_name

# test the endpoint
az ml online-endpoint invoke --name $endpoint_name --request-file sample-request.json

# remove deployment
#az ml online-endpoint delete --name $endpoint_name --yes