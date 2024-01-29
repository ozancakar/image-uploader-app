pipeline {
    options {
        // Bu, tüm 'sh' komutlarının hata durumunda devam etmesini sağlar
        skipStagesAfterUnstable()
    }

    agent any

    environment {
        DOCKER_IMAGE_NAME = 'ozanncakar/image-uploader-app'
        CONTAINER_PORT = 8080
        HOST_PORT = 8080
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    // 'sh' komutlarının hata durumlarını görmezden gel
                    sh 'set +e'
                    
                    // Git ile ilgili adımları buraya ekleyin
                    checkout scm

                    // 'sh' komutlarının hata kontrolünü geri getir
                    sh 'set -e'
                }
            }
        }

        stage('Pull Docker Image') {
            steps {
                script {
                    // 'sh' komutlarının hata durumlarını görmezden gel
                    sh 'set +e'
                    
                    // Docker Hub'dan imajı çek
                    docker.image("${DOCKER_IMAGE_NAME}:latest").pull()

                    // 'sh' komutlarının hata kontrolünü geri getir
                    sh 'set -e'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // 'sh' komutlarının hata durumlarını görmezden gel
                    sh 'set +e'
                    
                    // Docker imajını başlat
                    docker.container('my-container').withRun("-p ${HOST_PORT}:${CONTAINER_PORT} --name my-container") {
                        // İmaj başlatıldığında yapılacak adımlar
                        echo 'Container başlatıldı. Uygulamaya erişim sağlanabilir.'
                    }

                    // 'sh' komutlarının hata kontrolünü geri getir
                    sh 'set -e'
                }
            }
        }
    }

    post {
        always {
            // İşlemler tamamlandığında temizlik yap
            script {
                // 'sh' komutlarının hata durumlarını görmezden gel
                sh 'set +e'
                
                docker.image("${DOCKER_IMAGE_NAME}:latest").remove()
                docker.container('my-container').remove()

                // 'sh' komutlarının hata kontrolünü geri getir
                sh 'set -e'
            }
        }
    }
}
