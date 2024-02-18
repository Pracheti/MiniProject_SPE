pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'project_image'
        GITHUB_REPO_URL = 'https://github.com/Pracheti/MiniProject_SPE.git'
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
                    sh 'docker tag project_image pracheti/project_image:latest'
                    sh 'docker push pracheti/project_image'
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
