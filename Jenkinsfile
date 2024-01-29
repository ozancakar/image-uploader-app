pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Pull Docker Image') {
            steps {
                script {
                    // Buraya Docker imajını çekmek için kullanılacak komutu ekleyin
                    // Örneğin: sh 'docker pull your-docker-image:tag'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Buraya Docker konteynerını başlatmak için kullanılacak komutu ekleyin
                    // Örneğin: sh 'docker run -d your-docker-image:tag'
                }
            }
        }
    }

    post {
        always {
            // Her zaman çalışacak post işlemlerini buraya ekleyin
            // Örneğin: sh 'docker stop your-container-id'
        }
    }
}
