pipeline{
    agent any
    environment{
    PATH="/c/'Program Files (x86)'/apache-maven-3.8.2/bin:$PATH" 
   }
    stages{
        stage("welcome"){
            steps{
                echo "hello multipranch pipeline this is from stagefile"
            }
        }
        stage("maven build"){
            steps{
                sh "perform maven options"
            }
        }
        
    }
}
