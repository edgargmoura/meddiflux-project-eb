#!/bin/bash

INSTANCE_ID=$(aws ec2 describe-instances \
    --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=Meddiflux-hom" \
    --query "Reservations[].Instances[].InstanceId" \
    --output text --profile tf-bia-lab)

echo "Conectando na instância de Homologação"
echo "ID da instância: $INSTANCE_ID"

aws ssm start-session --target $INSTANCE_ID --document-name AWS-StartInteractiveCommand --parameters command="bash -l" --profile tf-bia-lab



