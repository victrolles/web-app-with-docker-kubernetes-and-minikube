minikube start

docker build -t frontend:latest ./frontend
docker build -t backend:latest ./backend

kubectl apply -f kubernetes/frontend-deployment.yaml
kubectl apply -f kubernetes/backend-deployment.yaml
kubectl apply -f kubernetes/frontend-service.yaml
kubectl apply -f kubernetes/backend-service.yaml

minikube image load frontend:latest
minikube image load backend:latest

kubectl delete pod -l app=frontend
kubectl delete pod -l app=backend

kubectl rollout restart deployment frontend
kubectl rollout restart deployment backend

kubectl set image deployment/frontend frontend=frontend:latest
kubectl set image deployment/backend backend=backend:latest

minikube service frontend-service

