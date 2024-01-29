pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'ozanncakar/image-uploader-app'
        CONTAINER_PORT = 8080
        HOST_PORT = 8080
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Hata durumunda devam etmek için set +e kullan
                    sh 'set +e'
                    
                    // Docker Hub'dan imajı çek
                    docker.image("${DOCKER_IMAGE_NAME}:latest").pull()

                    // Docker imajını başlat
                    docker.container('my-container').withRun('-p ${HOST_PORT}:${CONTAINER_PORT} --name my-container') {
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
                docker.image("${DOCKER_IMAGE_NAME}:latest").remove()
                docker.container('my-container').remove()
            }
        }
    }
}
