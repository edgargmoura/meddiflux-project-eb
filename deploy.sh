./build.sh
aws ecs update-service --cluster hom-meddiflux-cluster --service service-meddiflux-hom  --force-new-deployment