pipeline {
    agent any

    environment {
        // Jenkins'te önceden tanımlanmış Docker Hub kimlik bilgileri ve Docker imaj adı
        DOCKER_HUB_USER = credentials('DOCKER_HUB_USER')
        DOCKER_HUB_PASSWORD = credentials('DOCKER_HUB_PASSWORD')
        DOCKER_IMAGE_NAME = 'ozanncakar/image-uploader-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Docker imajını oluştur ve Docker Hub'a push et
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_USER, DOCKER_HUB_PASSWORD) {
                        def customImage = docker.build("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}")
                        customImage.push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Jenkins tarafından oluşturulan Docker imajını kullanarak uygulamayı deploy et
                    docker.image("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}").run('-p 8080:8080 -d')
                }
            }
        }
    }

    post {
        success {
            // Başarı durumunda yapılacak işlemler
        }
        failure {
            // Hata durumunda yapılacak işlemler
        }
    }
}
