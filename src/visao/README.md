# ***work in progress***

# Node de visão

Faz track de boias


## Usage/Examples

base: 
```
roslaunch es_vision vision.launch 
```

parâmetros:

- ``` debug ```- mostra janela com barras para ajustar parâmetros. Automaticamente usa ```show_original```
    * ```Frue```
    * ```False```
- ```show_original``` - mostra o vídeo original.
    * ```Frue```
    * ```False```

exemplo:
```
roslaunch es_vision vision.launch debug:=True
```
