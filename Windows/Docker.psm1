# Docker Control
Function Docker-Simple-Control($command) {
    $host.UI.RawUI.WindowTitle = "$command (Docker) | ${pwd}"
    Switch ($command) {
        start {
            docker pull node
            #docker pull bash
            #docker pull cirrusci/flutter
            #docker pull elasticsearch
            #docker pull gogs/gogs
            #docker pull haskell
            #docker pull libreoffice/online
            #docker pull mariadb
            #docker pull mathematica12/mathematica12
            #docker pull php
            #docker pull postgres
            docker pull omnimir/git
            docker pull omnimir/go
            docker pull omnimir/python
            #docker pull tensorflow/tensorflow
            #docker pull wordpress
        }
        update {
            docker images --format "{{.Repository}}:{{.Tag}}" | ForEach-Object { docker pull "$_" }
        }
        conts {
            docker ps
        }
        contsrm {
            docker rm $(docker ps -a -q)
        }
        ims {
            docker images
        }
        imsrm {
            docker rmi $(docker images -q)
        }
        git {
            docker run -it --rm `
                --name git `
                -v ${home}/_GITPATH:/root `
                -v ${pwd}:/project `
                -w /project `
                omnimir/git:latest `
                /bin/bash
        }
        go {
            docker run -it --rm `
                --name go `
                -e GOARCH=amd64 `
                -e GOOS=windows `
                -e GOPATH=/gopath `
                -v ${home}/_GOPATH:/gopath `
                -v ${pwd}:/project `
                -w /project `
                omnimir/go:latest `
                /bin/bash
        }
        python {
            docker run -it --rm `
                --name python `
                -v ${home}/_PYPATH:/usr/local/lib/python3.7/site-packages `
                -v ${pwd}:/project `
                -w /project `
                omnimir/python:latest `
                /bin/bash
        }
        default {
            echo "Administration"
            echo "  start, update, conts, contsrm, ims, imsrm"
            echo "Systems"
            echo "  git, go, python"
        }
    }
    $host.UI.RawUI.WindowTitle = "PowerShell"
}
Set-Alias dock -Value Docker-Simple-Control

# Docker Build
Function Docker-Simple-Build($file, $name) {
    if ($file -and $name) {
        docker build -f $file -t $name .
        docker push $name
    }
    else {
        echo 'dockbuild path/to/Dockerfile "repository/name:tag"'
    }
}
Set-Alias dockbuild -Value Docker-Simple-Build