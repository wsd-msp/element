@echo off

::Create cmd alias for general commands
doskey bash=docker-compose -f docker-compose.yml exec app bash

:: Doskeys for managing docker-compose
doskey up=docker-compose -f docker-compose.yml up $*
doskey rebuild=docker-compose -f docker-compose.yml up --build $*
doskey stop=docker-compose -f docker-compose.yml stop
doskey start=docker-compose -f docker-compose.yml start
doskey remove=docker-compose -f docker-compose.yml rm
doskey kill=docker-compose -f docker-compose.yml kill