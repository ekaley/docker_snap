# docker_snap

docker build -t snap .
docker run -p 8181:8181 -ti snap

CHANGE THE PASSWORD IN config.json


curl -X POST -F plugin=@snap-plugin-collector-esxi http://localhost:8181/v1/plugins

curl -vXPOST http://localhost:8181/v1/tasks -d @task.json --header "Content-Type: application/json"
curl -XPUT http://localhost:8181/v1/tasks/ddb125c4-07e1-4c8e-924a-b71aac1b9e28/start
curl -L http://localhost:8181/v1/tasks/ddb125c4-07e1-4c8e-924a-b71aac1b9e28/watch
