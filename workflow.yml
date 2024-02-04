name: Build and Push Docker Images

on:
  push:
    branches:
      - development

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Set up Docker
        uses: docker/setup-docker@v2
        with:
          dockerfile: Dockerfile
          context: .

      - name: Build Application Docker Image
        run: docker build -t ${{ secrets.AWS_ECR_REGISTRY_URI }}/webapp-assignment1:latest -f Dockerfile .

      - name: Build MySQL Docker Image
        run: docker build -t ${{ secrets.AWS_ECR_REGISTRY_URI }}/mysql-assignment1:latest -f Dockerfile.mysql .

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_SESSION_TOKEN: ${{ secrets.AWS_SESSION_TOKEN }}
          AWS_REGION: us-east-1

      - name: Log in to Amazon ECR
        run: aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${{ secrets.AWS_ECR_REGISTRY_URI }}

      - name: Push Application Docker Image to Amazon ECR
        run: docker push ${{ secrets.AWS_ECR_REGISTRY_URI }}/webapp-repo-assignment1:latest

      - name: Push MySQL Docker Image to Amazon ECR
        run: docker push ${{ secrets.AWS_ECR_REGISTRY_URI }}/mysql-repo-assignment1:latest


.

