pipeline {
                agent any
                stages {
                    stage('Build Artifact - Maven') {
                        steps {
                            sh "mvn clean package -DskipTests=true"
                            sh "hostname"
                            archive 'target/*.jar'
                        }
                        }

                    stage('Unit Tests - JUnit and JaCoCo') {
                        steps {
                            sh "mvn test"
                        }
                        post { 
                        always { 
                          junit 'target/surefire-reports/*.xml'
                          jacoco execPattern: 'target/jacoco.exec'
                        }
                        }
                    }

                    stage('Docker Build and Push') {
                        steps {
                            withDockerRegistry([credentialsId: "dockerhub", url: "https://https://hub.docker.com/"]) {
                            sh 'printenv'
                            sh 'sudo docker build -t khizarsheraz/devsecops:"khizar_image" .'
                            sh 'sudo docker push khizarsheraz/devsecops:"khizar_image"'
                            } 
                        }
                    }

                    stage("kUBERNETES DEPLOYMENT - dEV"){
                        steps{
                            withKubeConfig([credentialsId: 'kubeconfig']){
                              
                              sh "kubectl apply -f k8s_deployment_service.yaml"

                            }
                        }
                    }
                        
                }        
        } 


