#Windows использует сжатие системных файлов

#Запрос чтобы узнать какой сейчас режим
compact /compactos:query

#Отключение режима, что увеличивает быстродействие и объём ОС
compact /compactos:never

#Включение режима (дефолтное состояние), что уменьшает быстродействие и объём ОС
compact /compactos:always
