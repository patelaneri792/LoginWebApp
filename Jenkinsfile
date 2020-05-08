pipeline{
	agent any
	environment{
		PATH = "/usr/share/maven/bin:$PATH"
	stages{
		stage("Git Checkout"){
			steps{
				git credentialsId: 'gituser', url: 'https://github.com/Hemantakumarpati/LoginWebApp.git'
				}
			}
	stage("Maven Build"){
			steps{
				sh "maven clean package"
				}
			}
	stage("Docker Build"){
			steps{
				withDockerRegistry(credentialsId: 'dockeruser', url: 'hub.docker.com')
				docker build -t hemamntakumarpati/LoginWebApp:latest .
				echo "build successfully"
				}
			}
		}
	}
}
