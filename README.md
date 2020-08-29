# covid19_dockerfile

## First Step
1. Assuming that there are two directories in a /repo directory:
2. Git pull the source code from this repo: https://github.com/mtwtan/covid19_django_docker into a git folder on this repo's root directory:
```
/repo $ git clone https://github.com/mtwtan/covid19_dockerfile.git
/repo $ git clone https://github.com/mtwtan/covid19_django_docker.git
/repo $ cd covid19_dockerfile 

/repo/covid19_dockerfile $ mkdir -p /repo/covid19_dockerfile/git 
/repo/covid19_dockerfile $ cp -r /repo/covid19_django_docker /repo/covid19_dockerfile/git
```
3. Build the docker image
```
:/repo/covid19_dockerfile $ docker build <repository name>/django_covid19:<version> .   ## Note the period at the end
```
4. Run the docker image
```
:/repo/covid19_dockerfile $ docker run -dit --rm --name django -p 8000:8000 <image ID>
```
