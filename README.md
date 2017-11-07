# ansible-micro
for minimal cd https://github.com/merabpyh/webprog

## Использование:
TASK TAGS: [build, check, checkout, deploy, rollback, setup, test]

ansible-playbook mainbook.yml --tags=setup --extra-vars "r_user=roman r_host=test-centos7" 

Запускать следует от пользователя обладающего sudo привилегиями

## Роли основные:
--tags=setup - установка зависимостей, клонирование репозитория локально, запуск proxy

--tags=build - сборка проекта с последующей сборкой и тестированием образа контейнера

--tags=deploy - запуск контейнеров с приложением, запуская после build обновит версию приложения

--tags=rollback - запуск контейнеров с выбранной версией приложения

## Роли вспомогательные:
--tags=test - проверка сборки образа приложения с запуском\выключением тестового контейнера

--tags=check - проверка работы контейнера при deploy\rollback

--tags=checkout - клонирование репозитория

## Известные проблемы:
- поддерживается только centos6+ из-за использования модуля yum
- организовывать связь до хоста - ssh пароль или доступ по сертификату
- завести пользователя с правами sudo и передавать sudo пароль
- архитектурная проблема, при старте контейнера в java стартует spring обвязка - до 3-5 секунд,
что требует паузы перед проверкой и ведёт к неизбежному простою (решается переписыванием приложения на GO например)
- build:
    - при повторных вызовах будет переставиться докер из скрипта - добавить хендлер
- deploy:
    - при первом запуске двойная пересборка контейнера прода
- rollback:
    - необходимость предопределять вручную версию отката из имеющихся тегов образов контейнеров

## Пример команд:

ansible-playbook -K mainbook.yml \
        --tags=setup \
        --extra-vars \
        "r_host=test-centos7 r_user=roman"
        
ansible-playbook -K mainbook.yml \
        --tags=build \
        --extra-vars \
        "r_host=test-centos7 r_user=roman"
        
ansible-playbook -K mainbook.yml \
        --tags=deploy \
        --extra-vars \
        "r_host=test-centos7 r_user=roman"
        
ansible-playbook -K mainbook.yml \
        --tags=deploy \
        --extra-vars \
        "r_host=test-centos7 r_user=roman version=0.0.1a"
