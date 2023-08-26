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
                        }
                    
                    }        
        } 


