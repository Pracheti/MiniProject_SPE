pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'Project_Image'
        GITHUB_REPO_URL = 'https://github.com/Pracheti/SPE_MiniProject.git'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from the GitHub repository
                    git branch: 'master', url: "${GITHUB_REPO_URL}"
                }
            }
        }
   	stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("${DOCKER_IMAGE_NAME}", '.')
                }
            }
        }
	stage('Push Docker Images') {
            steps {
                script{
                    docker.withRegistry('', 'DockerId') {
                    sh 'docker tag Project_Image pracheti/Project_Image:latest'
                    sh 'docker push pracheti/Project_Image'
                    }
                 }
            }
        }
	stage('Run Ansible Playbook') {
            steps {
                script {
                    ansiblePlaybook(
                        playbook: 'deploy.yml',
                        inventory: 'inventory'
                     )
                }
            }
        }
    }
}
