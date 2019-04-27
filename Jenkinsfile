pipeline {
  agent any
  tools { 
        maven 'Maven'
        jdk 'JAVA_HOME'
  }
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'mvn -B -DskipTests clean package'
        sh 'echo $USER'
        sh 'echo whoami'
      }
    }
    stage('Push image') {
      steps {
        withDockerRegistry([credentialsId: 'docker-hub', url: "https://index.docker.io/v1/"]) {
          sh 'sudo docker login https://index.docker.io/v1/ -u=anil9848 -p=Password@12345'
          sh 'sudo /usr/bin/docker push anil9848/account-service:latest'
        }
      }
    }
    stage('push image to ECR'){
      steps {
       withDockerRegistry(credentialsId: 'ecr:us-east-1:aws-credentials', url: 'http://903218632467.dkr.ecr.us-east-1.amazonaws.com/example') {
       sh 'docker tag anil9848/account-service:latest 903218632467.dkr.ecr.us-east-1.amazonaws.com/example'
         sh 'docker push 903218632467.dkr.ecr.us-east-1.amazonaws.com/example'
}
      }
    }
    stage('deploy to ECR') {
      steps {
        node('EKS-master'){
          checkout scm
         sh 'aws eks --region us-east-1 update-kubeconfig --name terraform-eks'
         sh 'kubectl apply -f deployment.yaml'
         sh 'kubectl apply -f service.yaml'
        }
      }
    }
  }
}
