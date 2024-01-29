pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'ozanncakar/image-uploader-app'
        CONTAINER_PORT = 8080
        HOST_PORT = 8080
    }

    stages {
        stage('Pull Docker Image') {
            steps {
                script {
                    // Docker Hub'dan imajı çek
                    docker.image(DOCKER_IMAGE_NAME).pull()
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Docker imajını başlat
                    docker.container('my-container').withRun('-p ${HOST_PORT}:${CONTAINER_PORT}') {
                        // İmaj başlatıldığında yapılacak adımlar
                        echo 'Container başlatıldı. Uygulamaya erişim sağlanabilir.'
                    }
                }
            }
        }
    }

    post {
        always {
            // İşlemler tamamlandığında temizlik yap
            script {
                docker.image(DOCKER_IMAGE_NAME).remove()
            }
        }
    }
}
