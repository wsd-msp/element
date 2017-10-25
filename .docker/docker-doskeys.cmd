@echo off

SET VERSION=0.2-dev
::Create cmd alias for general commands
doskey go=docker-compose -f docker-compose.yml exec app go $*
doskey bash=docker-compose -f docker-compose.yml exec app bash
doskey pack=docker-compose -f docker-compose.yml exec app bash /build/build.sh
doskey build=@echo off $T cd ../ $T build.cmd $T cd .docker $T @echo on
doskey test=@echo off $T cd ../ $T test.cmd $T cd .docker $T @echo on
doskey run=docker-compose -f docker-compose.yml exec app go run -ldflags "-X main.agentVersion=%VERSION%" agent.go $*
doskey run-local=docker-compose -f docker-compose.yml exec app go run -ldflags "-X main.agentVersion=%VERSION%" agent.go -env local $*
doskey run-env=docker-compose -f docker-compose.yml exec app go run -ldflags "-X main.agentVersion=%VERSION%" agent.go -env $*
doskey set-version=SET VERSION=$*

:: Doskeys for managing docker-compose
doskey up=docker-compose -f docker-compose.yml up $*
doskey rebuild=docker-compose -f docker-compose.yml up --build $*
doskey stop=docker-compose -f docker-compose.yml stop
doskey start=docker-compose -f docker-compose.yml start
doskey remove=docker-compose -f docker-compose.yml rm
doskey kill=docker-compose -f docker-compose.yml kill