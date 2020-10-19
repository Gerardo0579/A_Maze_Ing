# A Maze Ing

## Descripción

Aplicación para resolución de laberintos hecho en ruby

## Características

A Maze Ing posee las siguientes características 

- Validaciones
    - Validaciones para matrices inválidas, nulas o vacías
    - Validación de valores usados para representación del laberinto
    - Validación para laberitnos rectangulares
    - Validación para asegurar un único queso y un único punto de salida
- Implementación
    - Set de pruebas elaborado con RSpec
    - Implementación de la gema Aspector para garantizar la ejecución de pruebas limpiamente
    - Alcance (scope) de métodos
    - Método para salida estándar de la información al resolver el laberinto (consola como salida estándar)
- Otros
    - **Better Comments**. El proyecto fue desarrollado usando Better Comments; una extensión de VS Code. Por ello, a través del código pueden hallarse comentarios como ***#!, #*, #TODO**, que responden al aprovechamiento de tal extensión

## Posibles futuras características

Si bien, A Maze Ing es un proyecto completo por sí mismo, en un futuro podría poseer nuevas interesantes caracterísitcas. A continuación se detalla una lista de posibles nuevas funcionalidades

- Permitir la búsqueda de más de un queso
- Permitir la introducción de enemigos quienes sean capaces de moverse a través del laberinto
- Laberintos irregulares
- Implementación de un API para usar A Maze Ing
- Crear una salida a archivo de texto
- Crear nueva salida donde se refleje el trayecto realizado

## Dependencias

Aunque es conveniente cumplir con todas las dependencias, no todas son indispensables. A Continuación se mencionan las dependecias y se indica cuándo son indispensables **(*)**.

- Aspector **(*)**
- VS Code con **Better Comments**
- Rspec para testing

## Ejecución

A Maze Ing es bastante simple de ejecutar. Para ello se deben seguir los siguientes pasos:

1. Usar **Bundle install** para generar el gemfile.lock
2. Ejecutar las pruebas con el comando **Rspec** en la carpeta raíz para asegurar que todas las pruebas son exitosas
3. Invocar A Maze Ing por medio de la clase AMazeIng donde se le requiera

## Ejemplo

```ruby
maze = [
        [ 2, 0, 0,],
        [ 0, 0, 0,],
        [ 0, 0, 1,],
    ]
puts AMazeIng.solve(maze)
# output => [ 2, 2]
```